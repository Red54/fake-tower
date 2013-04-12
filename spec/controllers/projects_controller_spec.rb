require 'spec_helper'

describe ProjectsController do

	describe "Get #index" do
		it "should GET /projects resource" do
			member = FactoryGirl.create(:member_with_projects)
			sign_in member

			get :index, format: :json

			response.should be_success
			response.body.should == member.projects.to_json
		end

		it "should not GET /projects resource" do
			member = FactoryGirl.create(:member_with_projects)

			hacker = FactoryGirl.create(:hacker)
			sign_in hacker

			get :index, format: :json

			response.should be_success
			response.body.should_not == member.projects.to_json
		end
	end

	describe "GET #show" do
		it "should GET /projects/:id.json resource" do
			member = FactoryGirl.create(:member_with_projects)
			sign_in member

			project = member.projects.first
			get :show, id: project.id, format: :json

			response.should be_success
			response.body.should == project.to_json
		end

		it "should NOT GET /projects/:id.json resource" do
			member = FactoryGirl.create(:member_with_projects)

			hacker = FactoryGirl.create(:hacker)
			sign_in hacker

			project = member.projects.first

			expect { 
				get :show, id: project.id, format: :json 
				}.to raise_error
		end
	end

	describe "GET #new" do
		it "should GET /projects/new resource" do
			member = FactoryGirl.create(:member_with_projects)
			sign_in member

			get :new, format: :json

			response.should be_success
		end
	end

	describe "post #create" do
		it "should POST /projects resource" do
			member = FactoryGirl.create(:member_with_projects)
			sign_in member

			new_project_attr = FactoryGirl.build(:new_project).attributes

			lambda do
				post :create, project: new_project_attr, format: :json
			end.should do 
				change(Project, :count).by(1)
				change(member.projects, :count).by(1)
				response.should be_success
			end
		end
	end

	describe "GET #{}edit" do
		it "should GET /projects/:id/edit resource" do
			member = FactoryGirl.create(:member_with_projects)
			sign_in member

			project = member.projects.first
			get :edit, id: project._id, format: :json

			response.should be_success			
		end

		it "should not GET /projects/:id/edit resource without permission" do
			member = FactoryGirl.create(:member_with_projects)
			
			hacker = FactoryGirl.create(:hacker)
			sign_in hacker

			project = member.projects.first

			expect {
				get :edit, id: project._id, format: :json
			}.to raise_error
		end
	end

	describe "PUT update" do
		it "should update /projects/:id resource" do
			member = FactoryGirl.create(:member_with_projects)
			sign_in member

			project = member.projects.first
			new_project_attr = FactoryGirl.build(:new_project).attributes
			old_project_attr = project.attributes

			lambda do
				put :update, {id: project._id, project: new_project_attr}, 
					format: :json
			end.should do
				project.attributes.should_not == old_project_attr
			end
		end

		it "should not update /projects/:id resource" do
			member = FactoryGirl.create(:member_with_projects)

			hacker = FactoryGirl.create(:hacker)
			sign_in hacker

			project = member.projects.first
			new_project_attr = FactoryGirl.build(:new_project).attributes

			put :update, {id: project._id, project: new_project_attr}, 
				format: :json

			response.code.should == '302'
		end
	end

	describe "DELETE destroy" do
		it "should delete /project/:id resource" do
			member = FactoryGirl.create(:member_with_projects)
			sign_in member

			project = member.projects.first

			lambda do
				delete :destroy, {id: project._id}, format: :json
			end.should do 
				change(Project, :count).by(-1)
				response.should be_success
			end
		end

		it "should delete /project/:id resource" do
			member = FactoryGirl.create(:member_with_projects)

			hacker = FactoryGirl.create(:hacker)
			sign_in hacker

			project = member.projects.first

			lambda do
				delete :destroy, {id: project._id}, format: :json
			end.should do 
				change(Project, :count).by(0)
			end
		end
	end
end
