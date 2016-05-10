class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :contents
      t.datetime :deadline
      t.boolean :flag

      t.timestamps
    end
  end
end
