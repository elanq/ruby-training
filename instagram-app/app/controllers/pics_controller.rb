class PicsController < ApplicationController

  def index
  end

  def create
    @pic = Pic.new(pic_params)
  end

  def new
    # create new instance of pic
    @pic = Pic.new
  end

  private
    def pic_params
      params.require(:pic).permit(:title, :description)
    end
end
