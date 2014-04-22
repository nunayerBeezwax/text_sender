class MessagesController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :new]

	def index
		@messages = Message.all
	end

	def new
		@message = Message.new
	end	

	def create
		@message = Message.new(message_params)
		if @message.save
			flash[:notice] = "Your mesage was sent!"
			redirect_to messages_path
		else
			render 'new'
		end
	end

	def show
		@message = Message.find(params[:id])
	end	

private
	def message_params
		params.require(:message).permit(:to, :from, :body)
	end
end