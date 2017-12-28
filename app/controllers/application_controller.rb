class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def judge_login
    if session[:user_id].nil?
      redirect_to new_session_path
    end
  end

  def login_user_reject
    if session[:user_id]
      redirect_to tasks_path
    end
  end

  def current_user
    if session[:user_id]
      if User.find(session[:user_id])
        currenrt_user = User.find(session[:user_id])
      end
    end
  end

end
