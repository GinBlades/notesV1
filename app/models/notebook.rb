class Notebook < ApplicationRecord
  has_ancestry
  acts_as_taggable
  belongs_to :user
  has_many :notes

  enum visibility: [:from_parent, :secret, :friends, :open]
end
