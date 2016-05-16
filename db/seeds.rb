# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Event.create(:name => 'abc', :start_at => '2016-04-18 14:55:25', :end_at => '2016-04-20 14:59:50')
Todo.create(:contents => '買い出し', :deadline => '2016-06-21 12:00:00')
Todo.create(:contents => '宿題', :deadline => '2016-06-19 15:00:00')
