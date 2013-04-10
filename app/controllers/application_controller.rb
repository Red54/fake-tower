class ApplicationController < ActionController::Base
  protect_from_forgery

  private
	def get_member
		authenticate_member!
		@member = current_member
	end
end
