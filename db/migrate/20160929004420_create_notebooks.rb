class CreateNotebooks < ActiveRecord::Migration[5.0]
  def change
    create_table :notebooks do |t|
      t.string :name, null: false
      t.string :ancestry
      t.belongs_to :user, foreign_key: true
      t.integer :visibility, default: 0

      t.timestamps
      t.index :ancestry
    end
    add_index :notebooks, [:name, :user_id], unique: true
  end
end
