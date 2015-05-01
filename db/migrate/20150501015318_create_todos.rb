class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :finished, default: false
      t.integer :category_id
      t.timestamps
    end
  end
end
