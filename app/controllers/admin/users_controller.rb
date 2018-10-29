class Admin::UsersController < ApplicationController
  before_action :admin_check

  def admin_check
    unless current_user.admin?
      flash[:error] = "Only admins can access this part of the website"
      redirect_to root_path
    end
  end

  def index
  	@users = User.admin_users
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)

  	if @user.save
  		redirect_to admin_users_path
  	else
  		render "new"
  	end
  end

  def toggle_type
  	@user = User.find(params[:id])
  	if @user.user?
  		@user.update(role:"manager")
  	else
  		@user.update(role:"user")
  	end
  	redirect_back fallback_location: admin_users_path
  end

  def toggle_status
  	@user = User.find(params[:id])
  	@user.update(active:!@user.active)
  	redirect_back fallback_location: admin_users_path
  end

  def update
   	@user = User.find(params[:id])
   	if @user.update_without_password(user_params)
    	redirect_to admin_user_path(@user)
   	else
    	render 'edit'
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def destroy
  	User.delete(User.find(params[:id]))
  	redirect_to admin_users_path
  end

  def edit
  	@user = User.find(params[:id])
  end

  private
  def user_params
  	params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
