class Note < ApplicationRecord
  acts_as_taggable
  belongs_to :notebook

  enum visibility: [:from_parent, :secret, :friends, :open]
end
