class TaskList
  include Mongoid::Document
  field :name, type: String
  
  belongs_to :project
  has_many :todos
end
