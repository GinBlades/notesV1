class Note < ApplicationRecord
  acts_as_taggable
  belongs_to :notebook

  enum visibility: [:inherited, :private, :friends, :public]
end
