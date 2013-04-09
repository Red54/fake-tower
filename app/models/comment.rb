class Comment
  include Mongoid::Document
  field :content, type: String
  belongs_to :member
  belongs_to :todo
  belongs_to :message
end
