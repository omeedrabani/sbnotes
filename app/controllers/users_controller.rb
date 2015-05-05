class UsersController < ApplicationController
  def index
    redirect_to current_user
  end

  def show
    if logged_in?
      if User.exists?(params[:id]) && current_user.id == User.find(params[:id]).id
        @user = User.find(params[:id])
      else
        redirect_to '/users'
      end
    else
      redirect_to '/'
    end 
  end

  def new
    @user = User.new
  end

  def edit
    if logged_in?
      if User.exists?(params[:id]) && current_user.id == User.find(params[:id]).id
        @user = User.find(params[:id])
      else
        redirect_to '/users'
      end
    else
      redirect_to '/'
    end 
  end

  def create
    if logged_in?
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Congratulations on your new SBNotes account!"
        log_in @user
        redirect_to @user
      else
        render 'new'
      end
    else
      redirect_to '/'
    end
  end

  def update
    if logged_in?
      @user = User.find(params[:id])

      if @user.update(user_params)
        flash[:success] = "Changes saved."
        redirect_to @user
      else
        render 'edit'
      end
    else
      redirect_to '/'
    end
  end

  def destroy
    if logged_in?
      @user = User.find(params[:id])
      @user.destroy

      redirect_to '/'
    else
      redirect_to '/'
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, 
        :password_confirmation)
    end
end
