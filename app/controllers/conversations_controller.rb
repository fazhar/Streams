class ConversationsController < ApplicationController
	layout 'user'

	before_action :logged_in?
	before_action :current_is_conversation_user, except: [:new, :show, :index]

	def index
	end

	def new
		@conversation = Conversation.new
	end

	def create
		@conversation = current_user.conversations.new(conversation_params)

		if @conversation.save
			redirect_to @conversation
		else
			render 'new'
		end
	end

	def show
		@conversation = Conversation.find(params[:id])
	end

	def edit
		@conversation = Conversation.find(params[:id])
	end

	def update
		@conversation = Conversation.find(params[:id])

		if @conversation.update(conversation_params)
			redirect_to @conversation
		else
			render 'edit'
		end
	end

	def destroy
		@conversation = Conversation.find(params[:id])
		@conversation.destroy
		redirect_to root_path
	end

	def follow
		@conversation = Conversation.find(params[:id])
		current_user.follows.create(conversation: @conversation)
		redirect_to root_path
	end

	def unfollow
		@conversation = Conversation.find(params[:id])
		@follow = current_user.follows.find_by_conversation_id(@conversation)
		@follow.destroy
		current_user.reload
		@conversation.reload
		redirect_to root_path
	end

	private
		def conversation_params
			params.require(:conversation).permit(:title, :description)
		end

		def current_is_conversation_user
			@conversation = Conversation.find(params[:id])
			if current_user != @conversation.user
				redirect_to root_path, alert: "You are not the author of this Stream."
			end
		end

end
