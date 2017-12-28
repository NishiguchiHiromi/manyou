class SessionsController < ApplicationController
  before_action :judge_login, only: :destroy
  before_action :login_user_reject, only: [:new, :create]

  def new
  end

  def create
    user = User.where(email: params[:email]).last
    @user = user
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to tasks_path
    else
      render :new
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

end
