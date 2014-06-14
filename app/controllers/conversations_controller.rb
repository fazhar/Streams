class ConversationsController < ApplicationController
	layout 'user'

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

	private
		def conversation_params
			params.require(:conversation).permit(:title, :description)
		end

end
