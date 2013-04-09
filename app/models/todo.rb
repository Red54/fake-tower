class Todo
  include Mongoid::Document
  field :content, type: String
  belongs_to :owner, :class_name => 'Member'
  has_many :comments
end
