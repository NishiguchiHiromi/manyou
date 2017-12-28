module ApplicationHelper
  def current_user
    if session[:user_id]
      if User.find(session[:user_id]).present?
        currenrt_user = User.find(session[:user_id])
      end
    end
  end

  def login?
    session[:user_id].present?
  end
end
