class Comment
  include Mongoid::Document
  field :content, type: String

  validates :content, presence: true

  belongs_to :member
  belongs_to :todo
  belongs_to :message
end
