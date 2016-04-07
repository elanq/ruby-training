class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all.order('created_at DESC')
  end

  def create
    @task = Task.new tasks_params
    if @task.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  private 
    def tasks_params
      params.require(:task).permit(:title, :description)
    end

    def find_task
      @task = Task.find(params[:id])
    end
end
