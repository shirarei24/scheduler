class AddWeekToEvent < ActiveRecord::Migration
  def change
    add_column :events, :mon, :integer
    add_column :events, :tue, :integer
    add_column :events, :wed, :integer
    add_column :events, :thu, :integer
    add_column :events, :fri, :integer
    add_column :events, :sat, :integer
    add_column :events, :sun, :integer
    add_column :events, :deadline, :datetime
  end
end
