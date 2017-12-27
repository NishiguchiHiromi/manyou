class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  def index
    @tasks = Task.all.order(:created_at)
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def update
    @task.update(tasks_params)
    redirect_to tasks_path
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      redirect_to(tasks_path)
    else
      render(:new)
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:title, :text, :status, :deadline)
  end
end
