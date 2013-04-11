require 'spec_helper'

describe ProjectsController do

	describe "Get #index" do
		it "works" do
			member = FactoryGirl.create(:member)
			sign_in member
			puts '*'
			puts member.current_team.name
			puts '*'
			# get "projects/#{member.current_team.projects(member).first._id}"
		end
	end
end
