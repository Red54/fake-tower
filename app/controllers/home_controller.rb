class HomeController < ApplicationController

  def index
  	if member_signed_in?
  		redirect_to team_path(current_member.current_team)
  	end
  end

end
