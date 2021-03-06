class PostsController < ApplicationController

	layout 'user'

	before_action :logged_in?
	before_action :current_is_post_user, except: [:new, :create]

	def create
		@conversation = Conversation.find(params[:conversation_id])
		@post = @conversation.posts.new(post_params)
		@post.user = current_user
		if @post.save
			redirect_to conversation_path(@conversation)
		else
			render 'new'
		end
	end

	def new
		@post = Post.new
		@conversation = Conversation.find(params[:conversation_id])
	end

	def edit
		@conversation = Conversation.find(params[:conversation_id])
		@post = @conversation.posts.find(params[:id])
	end

	def update
		@conversation = Conversation.find(params[:conversation_id])
		@post = @conversation.posts.find(params[:id])
		if @post.update(post_params)
			redirect_to @conversation
		else
			render 'edit'
		end
	end

	def destroy
		@conversation = Conversation.find(params[:conversation_id])
		@post = @conversation.posts.find(params[:id])
		@post.destroy
		redirect_to conversation_path(@conversation)
	end

	private
		def post_params
			params.require(:post).permit(:title, :content)
		end

		def current_is_post_user
			@conversation = Conversation.find(params[:conversation_id])
			@post = @conversation.posts.find(params[:id])
			if @post.user != current_user
				redirect_to root_path, alert: "You are not the author of this post."
			end
		end

end
