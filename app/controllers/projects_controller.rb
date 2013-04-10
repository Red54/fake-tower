class ProjectsController < ApplicationController

	before_filter { get_member }
	
	respond_to :json

	def index
		respond_with @member.projects
	end

	def show
		respond_with @member.projects.find(params[:id])
	end

	def new
		respond_with @member.projects.build
	end

	def create
		respond_with @member.projects.create(params[:project])
	end

	def edit
		respond_with @member.update(params[:id], params[:project])
	end

	def destroy
		respond_with Project.destroy(params[:id])
	end
end
