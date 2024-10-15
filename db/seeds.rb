# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

ItemTaxCategory.delete_all
Item.delete_all
TaxCategory.delete_all
Location.delete_all

#Create Locations
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



discount_rule_1 = DiscountRule.create
DiscountRuleTriggerItem.create(discount_rule_id: discount_rule_1.id, item_id: item1.id)
DiscountRuleTriggerItem.create(discount_rule_id: discount_rule_1.id, item_id: item2.id)
DiscountRuleDiscountedItem.create(discount_rule_id: discount_rule_1.id, item_id: item3.id, percentage: 100)

discount_rule_2 = DiscountRule.create
DiscountRuleTriggerItem.create(discount_rule_id: discount_rule_2.id, item_id: item4.id)
DiscountRuleTriggerItem.create(discount_rule_id: discount_rule_2.id, item_id: item5.id)
DiscountRuleDiscountedItem.create(discount_rule_id: discount_rule_2.id, item_id: item6.id, percentage: 100)
DiscountRuleDiscountedItem.create(discount_rule_id: discount_rule_2.id, item_id: item1.id, percentage: 50)

puts "Seed data created successfully!"
