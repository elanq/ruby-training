class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Pic.all.order('created_at DESC')
  end

  def create
    @pic = Pic.new(pic_params)

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

  private
    def pic_params
      params.require(:pic).permit(:title, :description)
    end

    def find_pic
      @pic = Pic.find(params[:id])
    end
end
