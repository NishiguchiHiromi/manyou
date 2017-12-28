class AdminController < ApplicationController
  before_action :admin_check

  def admin_check
    unless current_user
      return redirect_to tasks_path
    end

    unless current_user.admin?
      redirect_to tasks_path
    end
  end
end
