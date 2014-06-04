class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to root_path, notice: "Signed in!"
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice: "Signed out!"
	end

	def failure
		redirect_to signup_path, notice: "Authentication failed, try again."
	end

end
