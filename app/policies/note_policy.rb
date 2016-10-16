class NotePolicy
  def initialize(user)
    @user = user
  end

  def all
    Note.joins(:notebook).where("notebooks.user_id" => @user.id)
  end

  def visible?(note)
    all.pluck(:id).include?(note.id)
  end
end
