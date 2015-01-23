# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Item.update_all(restauraunt_id: 1)
Modification.update_all(restaurant_id: 1)
Employee.update_all(restaurant_id: 1)
Shift.update_all(restaurant_id: 1)
Sale.update_all(restaurant_id: 1)
SaleItem.update_all(restaurant_id: 1)
