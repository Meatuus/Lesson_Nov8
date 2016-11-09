class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: session_params[:email])

		if user && user.authenticate(session_params[:password])

			session[:user_id] = user.id #this is the cookie statement

			flash[:notice] = 'Successfully Logged In'
			redirect_to root_url
		else
			flash.now[:alert] = 'Invalid credentials'
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "youre logged out"
		redirect_to root_url
	end

	private
	def session_params
		params.require(:session).permit(:email, :password)
	end
end
