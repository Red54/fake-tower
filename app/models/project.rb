class Project
  include Mongoid::Document
  field :name, type: String

  ## Associations
  has_and_belongs_to_many :members, inverse_of: :projects
  has_many :messages, dependent: :destroy
  has_many :task_lists, dependent: :destroy

end
