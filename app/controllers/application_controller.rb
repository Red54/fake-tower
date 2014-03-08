class ApplicationController < ActionController::Base
  protect_from_forgery

  	private
	def current_project
		authenticate_member!
		@project = Project.find(params[:project_id])

		# Permission authenticate
		unless current_member.projects.include? @project
			return
		end
	end
end
