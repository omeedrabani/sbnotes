class UsersController < ApplicationController
  def index
    redirect_to current_user
  end

	def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
    end
    if !logged_in?
      redirect_to '/'
    elsif current_user != @user
      redirect_to current_user
    end
	end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      flash[:success] = "Congratulations on your new SBNotes account!"
      log_in @user
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, 
  			:password_confirmation)
  	end
end
