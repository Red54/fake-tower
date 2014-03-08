class Comment
  include Mongoid::Document

  field :content, type: String
  field :author_id, type: String
  field :author_name, type: String

  validates :content, presence: true

  ## Associations
  # To alternative choices,
  # embed might be a better approach than belongs_to

  embedded_in :todo
  embedded_in :message
end
