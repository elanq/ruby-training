class PlaysController < ApplicationController
  before_action :find_play, only: [:show, :update, :edit, :destroy]  
  before_action :authenticate_user!, except: [:index, :show]

  def index    
    if params[:category]
      @category_id = Category.find_by_name(params[:category])      
      @plays = Play.all.where(category_id: @category_id)
    else
      @plays = Play.all.order('created_at DESC')
    end
  end

  def new
    @play = current_user.plays.build 
    @categories = Category.all.map {|c| [c.name, c.id]}
  end

  def create
    @play = current_user.plays.build play_params
    @play.category_id = params[:category_id]    

    if @play.save
      redirect_to root_path, notice: "new play successfully saved"
    else
      flash[:error] = "Error when trying to create new play"
      render 'new'
    end
  end

  def show
    if @play.reviews.blank?
      @average_review = 0
    else
      @average_review = @play.reviews.average(:rating).round(2)
    end
  end

  def edit
    if !user_signed_in?
      redirect_to root_path, alert: "You can't access this page"      
    end
    @categories = Category.all.map do |c| 
      [c.name, c.id]
    end
  end

  def update    
    @play.category_id = params[:category_id]
    if @play.update play_params
      redirect_to play_path(@play), notice: "play successfully updated"
    else
      flash[:error] = "Error when trying to edit existing play"
      render 'edit'
    end
  end

  def destroy
    if !user_signed_in?
      redirect_to root_path, alert: "You can't access this page"
    end
    @play.destroy
    redirect_to root_path, notice: "Play successfully deleted"
  end

  private 

  def play_params
    params.require(:play).permit(:title, :description, :director, :category_id, :play_img)
  end

  def find_play
    @play = Play.find(params[:id])
  end
end
