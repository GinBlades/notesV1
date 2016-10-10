class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.belongs_to :notebook, foreign_key: true, null: false
      t.string :name, null: false
      t.string :body
      t.integer :visibility, default: 0, null: false

      t.timestamps
    end

    add_index :notes, [:notebook_id, :name], unique: true
  end
end
