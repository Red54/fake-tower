class Project
  include Mongoid::Document
  field :name, type: String

  belongs_to :team
  
  has_many :members
  has_many :messages
  has_many :todos

end
