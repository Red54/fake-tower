class MessagesController < ApplicationController

	respond_to :json, :html
	# respond_to :json, :html, only: :show

	before_filter :current_project

	def index
		@messages = @project.messages
		respond_with @project, @messages
	end

	def show
		@message = @project.messages.find(params[:id])
		respond_with @message
	end

	def new
		@message = @project.messages.build
		respond_with @project, @message
	end

	def create
		@message =  @project.messages.create(params[:message])
		respond_with @project, @message
	end

	def create_comment
		@message = @project.messages.find(params[:id])
		comment = @message.comments.create! params[:comment]

		data = "{ \"message_id\": \"#{@message._id}\", \"comment\": #{comment.to_json} }"
		$redis.publish 'message-comment', data

		send_data 'OK'
	end

end
