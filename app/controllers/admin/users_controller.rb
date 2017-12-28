class Admin::UsersController < AdminController
  layout "admin"
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all.page(params[:page]).per(3)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def update
    @user.update(users_params)
    redirect_to admin_users_path
  end

  def destroy
    @user.tasks.destroy_all
    @user.destroy
    redirect_to admin_users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:name, :password, :email, :user_type)
  end

end
