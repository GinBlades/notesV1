class Note < ApplicationRecord
  acts_as_taggable
  belongs_to :notebook

  enum visibility: [:from_parent, :secret, :friends, :open]

  validates :name, :notebook_id, :visibility, null: false
end
