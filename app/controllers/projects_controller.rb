class ProjectsController < ApplicationController
	
	before_filter :current_projects
	respond_to :json, :html

	def index
		respond_with @projects
	end

	def show
		@project = @projects.find(params[:id])
		respond_with @project
	end

	def new
		@project = @projects.build
		respond_with @project
	end

	def create
		respond_with @projects.create(params[:project])
	end

	def edit
		respond_with @projects.find(params[:id])
	end

	def update
		respond_with @projects.update(params[:id], params[:project])
	end

	def destroy
		respond_with @projects.destroy(params[:id], params[:project])
	end
	
	private
	def current_projects
		authenticate_member!

		# authentication for the project
		# must be in the name of the current_member
		@projects = current_member.current_team.projects(current_member)
	end
end
