class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  def index
    if current_user.present?
      @tasks = Task.where({user_id: current_user.id}).order('created_at DESC')
    end
  end

  def create
    @task = current_user.tasks.build tasks_params
    if @task.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def edit    
  end

  def update
    if @task.update tasks_params
      redirect_to task_path @task
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  def complete    
    @task = Task.find(params[:id])
    if current_user == @task.user
      @task.update_attribute(:completed_at, Time.now)
      redirect_to root_path
    else
      redirect_to root_path, notice: "You are not allowed to complete this operation"
    end
  end

  private 
    def tasks_params
      params.require(:task).permit(:title, :description)
    end

    def find_task
      @task = Task.find(params[:id])
    end
end
