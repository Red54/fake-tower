class TeamsController < ApplicationController
	respond_to :json, :html

	before_filter :authenticate_member!

	def show
	end

end
