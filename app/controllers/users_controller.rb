class UsersController < ApplicationController

	layout "user"

	def home
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])	
	end

	def update
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end

	# private
	# 	def user_params
	# 		params.require(:user).permit(:about, :location)
	# 	end

end
