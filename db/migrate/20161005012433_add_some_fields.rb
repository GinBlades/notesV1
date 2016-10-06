class AddSomeFields < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :summary, :string
    add_column :notebooks, :description, :string
  end
end
