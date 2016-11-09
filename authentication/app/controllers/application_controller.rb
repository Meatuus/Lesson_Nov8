class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	helper_method :current_user

	def current_user
		# if session[:user_id]
		#   return it
		# else
		#   nil
		# end

		session[:user_id] && User.find(session[:user_id])
		# this line basically does what the sudo code above does
	end

end
