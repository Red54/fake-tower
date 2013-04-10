class Comment
  include Mongoid::Document
  field :content, type: String
  field :author_id, type: String
  field :author_name, type: String

  validates :content, presence: true
  
  embedded_in :todo
  embedded_in :message
end
