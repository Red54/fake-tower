class Message
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  belongs_to :owner, :class_name => 'Member'
  has_many :comments
end
