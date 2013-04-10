class HomeController < ApplicationController
  def index
  	redirect_to team_path(@member.team)
  end
end
