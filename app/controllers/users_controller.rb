class UsersController < ApplicationController
  before_action :judge_login, only: [:edit, :update, :destroy]
  before_action :login_user_reject, only: [:new, :create]
  before_action :set_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(tasks_path)
    else
      render(:new)
    end
  end


  def edit
  end

  def update
    @user.update(users_params)
    redirect_to tasks_path
  end

  def destroy
    if User.admin.count == 1 && @user.admin?
      return redirect_to tasks_path
    end
    session[:user_id] = nil
    @user.tasks.destroy_all
    @user.destroy
    redirect_to new_session_path
  end

  private
  def set_user
    @user = current_user
  end

  def users_params
    params.require(:user).permit(:name, :password, :email, :user_type)
  end

end
