class PlaysController < ApplicationController
  before_action :find_play, only: [:show, :update, :edit, :destroy]

  def index
    @plays = Play.all.order('created_at DESC')
  end

  def new
    @play = current_user.play.build 
  end

  def create
    @play = current_user.play.build play_params

    if @play.save
      redirect_to root_path, notice: "new play successfully saved"
    else
      flash[:error] = "Error when trying to create new play"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @play.update play_params
      redirect_to play_path(@play), notice: "play successfully updated"
    else
      flash[:error] = "Error when trying to edit existing play"
      render 'edit'
    end
  end

  def destroy
    @play.destroy
    redirect_to root_path, notice: "Play successfully deleted"
  end

  private 

  def play_params
    params.require(:play).permit(:title, :description, :director)
  end

  def find_play
    @play = Play.find(params[:id])
  end
end
