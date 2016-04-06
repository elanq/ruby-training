class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]


  def index
    @pics = Pic.all.order('created_at DESC')
  end

  def create
    @pic = current_user.pics.build(pic_params)

    if @pic.save
      redirect_to @pic, notice: "Pic is saved"
    else
      render 'new'
    end
  end

  def new
    # create new instance of pic
    @pic = Pic.new
  end

  def show
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: "Picture was updated"
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    redirect_to root_path, notice: "Picture was deleted"
  end


  private
    def pic_params
      params.require(:pic).permit(:title, :description)
    end

    def find_pic
      @pic = Pic.find(params[:id])
    end
end
