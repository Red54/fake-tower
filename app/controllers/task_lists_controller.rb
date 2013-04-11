class TaskListsController < ApplicationController

	respond_to :json, :html
	before_filter :current_project

	def index
		@task_lists = @project.task_lists
		respond_with @project, @task_lists
	end

	def show
		@task_list = @project.task_lists.find(params[:id])
		respond_with @project, @task_list
	end

	def new
		@task_list = @project.task_lists.build
		respond_with @project, @task_list
	end

	def create
		@task_list =  @project.task_lists.create(params[:task_list])
		respond_with @project, @task_list
	end

	def destroy
		@task_list = @project.task_lists.find(params[:id])
		respond_with @task_list.destroy
	end
end
