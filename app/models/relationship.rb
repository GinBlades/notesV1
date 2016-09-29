class Relationship < ApplicationRecord
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  enum relation: [:pending, :friend, :partner]
end
