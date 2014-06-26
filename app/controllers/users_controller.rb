class UsersController < ApplicationController

	layout "user"

	def home
		@posts = []
		current_user.conversations.each do |conversation|
			@posts += conversation.posts
		end

		current_user.followed_conversations.each do |conversation|
			@posts += conversation.posts
		end
		@posts = @posts.sort_by(&:created_at).reverse
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
		if current_user != @user
			redirect_to root_path
		end
	end

	def settings
		@user = User.find(params[:id])
		if current_user != @user
			redirect_to root_path
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		reset_session
		redirect_to root_path
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :about, :location)
		end

end
