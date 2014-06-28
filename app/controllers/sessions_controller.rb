class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.from_omniauth(env["omniauth.auth"])
		if @user
			session[:user_id] = @user.id
			redirect_to root_path
		else
			@user = User.create_with_omniauth(env["omniauth.auth"])
			session[:user_id] = @user.id
			redirect_to edit_user_path(@user)
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

	def failure
		redirect_to root_path, alert: "Authentication failed, try again."
	end

end
