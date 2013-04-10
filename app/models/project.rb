class Project
  include Mongoid::Document
  field :name, type: String

  belongs_to :team
  
  has_and_belongs_to_many :members, inverse_of: :projects
  has_many :messages
  has_many :todos

end
