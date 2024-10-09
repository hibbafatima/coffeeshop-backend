# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

User.delete_all
Item.delete_all
TaxCategory.delete_all
ItemTaxCategory.delete_all
Location.delete_all

# Create Users
user1 = User.create(name: 'Alice Johnson', email: 'alice@example.com')
user2 = User.create(name: 'Bob Smith', email: 'bob@example.com')

# Create Items
item1 = Item.create(name: 'Espresso', description: 'Lorem ipsum dolor sit amet', price: 2.50)
item2 = Item.create(name: 'Latte', description: 'Lorem ipsum dolor sit amet', price: 3.50)
item3 = Item.create(name: 'Cappuccino', description: 'Lorem ipsum dolor sit amet', price: 3.00)
item4 = Item.create(name: 'Mocha', description: 'Lorem ipsum dolor sit amet', price: 4.00)
item5 = Item.create(name: 'Cold Brew', description: 'Lorem ipsum dolor sit amet', price: 3.00)
item6 = Item.create(name: 'Croissant', description: 'Lorem ipsum dolor sit amet', price: 2.00)

# Create Tax Categories
tax_category1 = TaxCategory.create!(name: 'Standard', discount_rate: 0.0)
tax_category2 = TaxCategory.create!(name: 'Reduced', discount_rate: 5.0)

# Associate Items with Tax Categories
ItemTaxCategory.create(item: item1, tax_category: tax_category1)
ItemTaxCategory.create(item: item2, tax_category: tax_category1)
ItemTaxCategory.create(item: item3, tax_category: tax_category1)
ItemTaxCategory.create(item: item4, tax_category: tax_category1)
ItemTaxCategory.create(item: item5, tax_category: tax_category1)
ItemTaxCategory.create(item: item6, tax_category: tax_category2)

Location.create(name: 'New York')
Location.create(name: 'Los Angeles')
Location.create(name: 'Chicago')
Location.create(name: 'Houston')
Location.create(name: 'Phoenix')
Location.create(name: 'Philadelphia')
Location.create(name: 'San Antonio')
Location.create(name: 'San Diego')
Location.create(name: 'Dallas')
Location.create(name: 'San Jose')

puts "Seed data created successfully!"
