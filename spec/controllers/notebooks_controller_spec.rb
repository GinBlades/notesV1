require 'rails_helper'

RSpec.describe NotebooksController, type: :controller do

  
  describe "Standard CRUD" do
    let(:instance_notebook) { assigns(:notebook) }
    let(:base_notebook) { create(:notebook) }
    let(:static_notebook) { create(:notebook, name: 'spec-notebook') }
    let(:valid_attributes) { attributes_for(:notebook, name: 'spec-notebook') }
    let(:invalid_attributes) { attributes_for(:notebook, name: nil) }
  
    describe "GET #index" do
      it "populates an array of all @notebooks" do
        second_notebook = create :notebook
        get :index
        expect(assigns(:notebooks)).to match_array([base_notebook, second_notebook])
      end
    end
  
    describe "GET show" do
      it "assigns the requested notebook as @notebook" do
        get :show, id: base_notebook
        expect(instance_notebook).to eq(base_notebook)
      end
    end

    describe "GET new" do
      it "assigns a new notebook as @notebook" do
        get :new
        expect(instance_notebook).to be_a_new(Notebook)
      end
    end

    describe "GET edit" do
      it "assigns the requested notebook as @notebook" do
        get :edit, id: base_notebook
        expect(instance_notebook).to eq(base_notebook)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Notebook" do
          expect do
            post :create, notebook: valid_attributes
          end.to change(Notebook, :count).by(1)
        end

        it "assigns a newly created notebook as @notebook" do
          post :create, notebook: valid_attributes
          expect(instance_notebook).to be_a(Notebook)
          expect(instance_notebook).to be_persisted
        end

        it "redirects to the created notebook" do
          post :create, notebook: valid_attributes
          expect(response).to redirect_to(Notebook.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved notebook as @notebook" do
          post :create, notebook: invalid_attributes
          expect(instance_notebook).to be_a_new(Notebook)
        end

        it "re-renders the 'new' template" do
          post :create, notebook: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested notebook as @notebook" do
          put :update, id: static_notebook, notebook: valid_attributes
          static_notebook.reload
          expect(instance_notebook).to eq(static_notebook)
        end

        it "redirects to the notebook" do
          put :update, id: static_notebook, notebook: valid_attributes
          expect(response).to redirect_to(static_notebook)
        end
      end

      describe "with invalid params" do
        it "assigns the notebook as @notebook" do
          put :update, id: static_notebook, notebook: invalid_attributes
          expect(assigns(:notebook)).to eq(static_notebook)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_notebook, notebook: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested notebook" do
        new_notebook = create :notebook
        expect do
          delete :destroy, id: new_notebook
        end.to change(Notebook, :count).by(-1)
      end

      it "redirects to the notebook list" do
        delete :destroy, id: base_notebook
        expect(response).to redirect_to(notebooks_url)
      end
    end
  end
end
