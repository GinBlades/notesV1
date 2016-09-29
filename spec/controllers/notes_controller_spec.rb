require 'rails_helper'

RSpec.describe NotesController, type: :controller do

  
  describe "Standard CRUD" do
    let(:instance_note) { assigns(:note) }
    let(:base_note) { create(:note) }
    let(:static_note) { create(:note, name: 'spec-note') }
    let(:valid_attributes) { attributes_for(:note, name: 'spec-note') }
    let(:invalid_attributes) { attributes_for(:note, name: nil) }
  
    describe "GET #index" do
      it "populates an array of all @notes" do
        second_note = create :note
        get :index
        expect(assigns(:notes)).to match_array([base_note, second_note])
      end
    end
  
    describe "GET show" do
      it "assigns the requested note as @note" do
        get :show, id: base_note
        expect(instance_note).to eq(base_note)
      end
    end

    describe "GET new" do
      it "assigns a new note as @note" do
        get :new
        expect(instance_note).to be_a_new(Note)
      end
    end

    describe "GET edit" do
      it "assigns the requested note as @note" do
        get :edit, id: base_note
        expect(instance_note).to eq(base_note)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Note" do
          expect do
            post :create, note: valid_attributes
          end.to change(Note, :count).by(1)
        end

        it "assigns a newly created note as @note" do
          post :create, note: valid_attributes
          expect(instance_note).to be_a(Note)
          expect(instance_note).to be_persisted
        end

        it "redirects to the created note" do
          post :create, note: valid_attributes
          expect(response).to redirect_to(Note.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved note as @note" do
          post :create, note: invalid_attributes
          expect(instance_note).to be_a_new(Note)
        end

        it "re-renders the 'new' template" do
          post :create, note: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested note as @note" do
          put :update, id: static_note, note: valid_attributes
          static_note.reload
          expect(instance_note).to eq(static_note)
        end

        it "redirects to the note" do
          put :update, id: static_note, note: valid_attributes
          expect(response).to redirect_to(static_note)
        end
      end

      describe "with invalid params" do
        it "assigns the note as @note" do
          put :update, id: static_note, note: invalid_attributes
          expect(assigns(:note)).to eq(static_note)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_note, note: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested note" do
        new_note = create :note
        expect do
          delete :destroy, id: new_note
        end.to change(Note, :count).by(-1)
      end

      it "redirects to the note list" do
        delete :destroy, id: base_note
        expect(response).to redirect_to(notes_url)
      end
    end
  end
end
