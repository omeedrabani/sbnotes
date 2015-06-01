class PasswordResetsController < ApplicationController
   before_action :get_user,   only: [:edit, :update]
   before_action :valid_user, only: [:edit, :update]
   before_action :check_expiration, only: [:edit, :update]

  def new
  end

 def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      set_host_from_request
      UserMailer.password_reset(@user).deliver
      flash[:notice] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:notice] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

 def update
    if params[:user][:password].empty?
      flash.now[:notice] = "Password can't be empty"
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:notice] = "Password has been reset."
      redirect_to @user
    else
      render 'edit'
    end
  end

   private

    def set_host_from_request
    ActionMailer::Base.default_url_options = { host: request.host_with_port }
    end
    
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end


    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      unless (@user &&
              @user.authenticated?(params[:id]))
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
