class Message
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  
  has_many :comments, dependent: :destroy
  belongs_to :project
end
