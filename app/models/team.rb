class Team
  include Mongoid::Document
  has_many :projects
  has_many :members
end
