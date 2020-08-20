# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Create ingredients"
filepath = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
serialized_ingredients = File.read(filepath)    # File.read Method - reads the file
ingredients = JSON.parse(serialized_beers)
ingredients_array = ingredients[:drinks]
ingredients_array.each do |ingredient|
  Ingredient.create!(name: ingredient.value)
end

puts "Successfully created ingredients"
