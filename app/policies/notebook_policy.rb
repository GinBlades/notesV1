class NotebookPolicy
  def initialize(user)
    @user = user
  end

  def all
    Notebook.where(user_id: @user.id)
  end

  def visible?(notebook)
    all.pluck(:id).include?(notebook.id)
  end
end
