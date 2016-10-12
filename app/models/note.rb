class Note < ApplicationRecord
  acts_as_taggable
  belongs_to :notebook

  enum visibility: [:from_parent, :secret, :friends, :unrestricted]

  validates :name, :notebook_id, :visibility, presence: true
  validates :name, uniqueness: { scope: :notebook_id, case_sensitive: false }

  def default_notebook(user)
    notebook = Notebook.find_or_create_by(name: "Untitled", user: user)
    self.notebook_id = notebook.id
  end
end
