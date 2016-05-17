class AddColumnToEvent < ActiveRecord::Migration
  def change
    add_column :events, :place, :string
    add_column :events, :person, :string
    add_column :events, :baggage, :string
  end
end
