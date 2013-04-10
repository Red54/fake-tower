class Todo
  include Mongoid::Document
  field :content, type: String

  belongs_to :task_list
  belongs_to :owner, :class_name => 'Member'
  embeds_many :comments
end
