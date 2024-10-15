# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

#Create Locations
location1 = Location.create(name: 'New York')
location2 = Location.create(name: 'Los Angeles')

# Create Items
item1 = Item.create(name: 'Espresso', description: 'Lorem ipsum dolor sit amet', price: 2.50)
item2 = Item.create(name: 'Latte', description: 'Lorem ipsum dolor sit amet', price: 3.50)
item3 = Item.create(name: 'Cappuccino', description: 'Lorem ipsum dolor sit amet', price: 3.00)
item4 = Item.create(name: 'Mocha', description: 'Lorem ipsum dolor sit amet', price: 4.00)
item5 = Item.create(name: 'Cold Brew', description: 'Lorem ipsum dolor sit amet', price: 3.00)
item6 = Item.create(name: 'Croissant', description: 'Lorem ipsum dolor sit amet', price: 2.00)

# Associate Items with Tax Categories
ItemTaxCategory.create(item: item1, location: location1, tax_rate: 15.5)
ItemTaxCategory.create(item: item1, location: location2, tax_rate: 14.5)
ItemTaxCategory.create(item: item2, location: location1, tax_rate: 13.5)
ItemTaxCategory.create(item: item2, location: location2, tax_rate: 4.5)
ItemTaxCategory.create(item: item3, location: location1, tax_rate: 65.5)
ItemTaxCategory.create(item: item3, location: location2, tax_rate: 4.5)
ItemTaxCategory.create(item: item4, location: location1, tax_rate: 6.5)
ItemTaxCategory.create(item: item4, location: location2, tax_rate: 7.5)
ItemTaxCategory.create(item: item5, location: location1, tax_rate: 13.5)
ItemTaxCategory.create(item: item5, location: location2, tax_rate: 12.5)
ItemTaxCategory.create(item: item6, location: location1, tax_rate: 11.5)
ItemTaxCategory.create(item: item6, location: location2, tax_rate: 14.5)

puts "Seed data created successfully!"
