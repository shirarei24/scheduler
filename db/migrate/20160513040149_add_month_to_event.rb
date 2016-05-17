class AddMonthToEvent < ActiveRecord::Migration
  def change
    add_column :events, :month, :integer
  end
end
