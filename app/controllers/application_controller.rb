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

	private 
		def current_user
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		end

		def conversations
			@conversations ||= current_user.conversations.all if session[:user_id]
		end

end
