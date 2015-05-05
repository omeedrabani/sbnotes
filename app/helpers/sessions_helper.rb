module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	#remember me
	def remember(user)
    user.remember
    #this makes it remember permanently
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    end



	def current_user
		if (user_id = session[:user_id])
      		@current_user ||= User.find_by(id: user_id)
    	
    	elsif (user_id = cookies.signed[:user_id]) #retrieve/login in the session (remember me)
      		user = User.find_by(id: user_id)
      		
      		if user && user.authenticated?(cookies[:remember_token])
        		
        		log_in user
        		@current_user = user
      		end
    	
    	end
	
	end

	
	
	def logged_in?
		!current_user.nil?
	end

	def forget(user)
   	 	user.forget
    	cookies.delete(:user_id)
    	cookies.delete(:remember_token)
 	end

	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end
end
