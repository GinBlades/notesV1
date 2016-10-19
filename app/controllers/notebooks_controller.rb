class NotebooksController < ApplicationController
  before_action :set_policy
  before_action :set_notebook, only: [:show, :edit, :update, :destroy]
  before_action :access, only: [:show, :edit, :update, :destroy]

  def index
    @notebooks = @policy.all
  end

  def show
  end

  def new
    @notebook = Notebook.new
  end

  def edit
  end

  def create
    @notebook = Notebook.new(notebook_params)
    @notebook.user_id = current_user.id

    if @notebook.save
      redirect_to @notebook, notice: 'Notebook was successfully created.'
    else
      render :new
    end
  end

  def update
    if @notebook.update(notebook_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @notebook.destroy
    head :no_content
  end

  private
    def set_notebook
      @notebook = Notebook.find(params[:id])
    end

    def notebook_params
      params.require(:notebook).permit(:name, :description, :ancestry, :user_id, :visibility)
    end

    def set_policy
      @policy = NotebookPolicy.new(current_user)
    end

    def access
      render json: { errors: "This is not one of your notebooks.", status: 422 } unless @policy.visible?(@notebook)
    end
end
