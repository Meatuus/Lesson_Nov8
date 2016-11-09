class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = 'Account Created Successfully!'
			redirect_to root_url
		else
			flash.now[:error] = 'Sorry Try Again!'
			# use flash.now when using render because render does not generate a new request unlike redirect_to
			render :new
		end

	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation) #these permit params are what you are allowing to be completed
	end

end
