class UsersController < ApplicationController
  ##
  #@usage:: redirects to current user
  def index
    redirect_to current_user
  end

  ##
  #@usage:: show user page if logged in
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

  ##
  #@usage:: create new user
  def new
    @user = User.new
  end

  ##
  #@usage:: if logged in, allow user to edit
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

  ##
  #@usage:: create a new user
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Congratulations on your new SBnotes account!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  ##
  #@usage:: update a user if logged in
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

  ##
  #@usage:: destroy a user if currently logged in
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
