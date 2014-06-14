class PostsController < ApplicationController

	def create
		@conversation = Conversation.find(params[:conversation_id])
		@post = @conversation.posts.new(post_params)
		@post.user = current_user
		current_user.posts << @post
		@post.save
		@current_user.save
		redirect_to conversation_path(@conversation)
	end

	private
		def post_params
			params.require(:post).permit(:title, :content)
		end
end
