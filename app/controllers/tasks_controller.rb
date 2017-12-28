class TasksController < ApplicationController
  before_action :judge_login
  before_action :set_task, only: [:edit, :update, :destroy]
  def index
    status = params[:status]
    word = params[:word]
    sorted_by = params[:sorted_by]

    session[:status] = status
    session[:word] = word
    session[:sorted_by] = sorted_by

    @tasks = current_user.tasks

    unless status.blank?
      @tasks = @tasks.where(status: status)
    end

    unless word.blank?
      @tasks = @tasks.search(word)
    end

    unless sorted_by.blank?
      sort_hash = {"priority" => "desc","deadline" => "asc"}
      @tasks = @tasks.order("#{sorted_by} #{sort_hash[sorted_by]}")
    end

    @tasks = @tasks.page(params[:page]).per(3)

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
    params.require(:task).permit(:title, :text, :status, :deadline, :priority, :user_id)
  end
end
