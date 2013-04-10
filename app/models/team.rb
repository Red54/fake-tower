class Team
  include Mongoid::Document

  ## Associations
  has_and_belongs_to_many :members, inverse_of: :teams
  # The team members that currently work for the team
  has_many :current_members, class_name: "Member", inverse_of: :current_team

  # The projects that own by the member in such team
  def projects(member)
  	if members.include? member
  		member.projects
  	else
  		[]
  	end
  end
end
