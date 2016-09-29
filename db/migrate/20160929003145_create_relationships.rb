class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.belongs_to :user1, null: false
      t.belongs_to :user2, null: false
      t.integer :relation, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :relationships, :users, column: :user1_id
    add_foreign_key :relationships, :users, column: :user2_id
    add_index :relationships, [:user1_id, :user2_id], unique: true
  end
end
