class Notebook < ApplicationRecord
  has_ancestry
  acts_as_taggable
  belongs_to :user

  enum visibility: [:inherited, :private, :friends, :public]
end
