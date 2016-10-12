class Notebook < ApplicationRecord
  has_ancestry
  acts_as_taggable
  belongs_to :user
  has_many :notes

  enum visibility: [:from_parent, :secret, :friends, :unrestricted]

  validates :name, :user_id, :visibility, presence: true
  validates :name, uniqueness: { scope: :user_id, case_sensitive: false }
end
