class Todo
  include Mongoid::Document
  field :content, type: String

  belongs_to :task_list
  belongs_to :owner, :class_name => 'Member'
  has_many :comments, dependent: :destroy
end
