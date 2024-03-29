class NotesController < ApplicationController
  before_action :set_policy
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :access, only: [:show, :edit, :update, :destroy]

  def index
    @notes = @policy.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)

    @note.default_notebook(current_user) if @note && @note.notebook_id.blank?
    if @note.save
      redirect_to @note, notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  def update
    if @note.update(note_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    head :no_content
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:notebook_id, :name, :summary, :body, :visibility)
    end

    def set_policy
      @policy = NotePolicy.new(current_user)
    end

    def access
      render json: { errors: "This is not one of your notes.", status: 422 } unless @policy.visible?(@note)
    end
end
