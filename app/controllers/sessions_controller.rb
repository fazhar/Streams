class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to root_path, alert: "Signed in!"
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, alert: "Signed out!"
	end

	def failure
		redirect_to signup_path, alert: "Authentication failed, try again."
	end

end
