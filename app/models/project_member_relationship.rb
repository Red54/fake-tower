class ProjectMemberRelationship
  include Mongoid::Document
  
  belongs_to :project
  belongs_to :member
end
