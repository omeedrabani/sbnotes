class SessionsController < ApplicationController
  ##
  #@usage:: if already logged in, redirect
  def new
  	if logged_in?
  		redirect_to notes_path
  	end
  end

  ##
  #@usage:: create new session using user credentials
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to '/notes'
    else
      flash.now[:notice] = "· Invalid email/password combination"
      
      render 'new'
    end
  end

  ##
  #@usage:: destroy current session
  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end

end
