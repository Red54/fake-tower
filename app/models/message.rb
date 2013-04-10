class Message
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  
  embeds_many :comments
  belongs_to :project
end
