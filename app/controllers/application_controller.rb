class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	helper_method :current_user, :conversations

	def choose_root
		if current_user
			redirect_to user_home_path
		else
			redirect_to home_path
		end
	end

	def routing_error
		redirect_to root_path, alert: "That page does not exist."
	end

	private 

		def logged_in?
			if !current_user
				redirect_to home_path, alert: "You must be logged in to continue."
			end
		end

		def current_user
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		end

		def conversations
			@conversations ||= current_user.conversations.all if session[:user_id]
		end

end
