# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'


puts "Create ingredients"
Ingredient.all.destroy

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)
ingredients_array = ingredients["drinks"]
ingredients_array.each do |ingred|
  ingriedent = Ingredient.create!(name: ingred["strIngredient1"])
end

puts "Successfully created ingredients"


puts "Create cocktails"
Cocktails.all.destroy

base_id = 11000
30.times do
  url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{base_id}"
  cocktail_serialized = open(url).read
  cocktail_s = JSON.parse(ingredients_serialized)
  cocktail_array = cocktail_s[:drinks]
  cocktail_array.each do |pair|
    cocktail = Cocktail.new!(
      name: pair[:strDrink]
    )

  dose = Dose.new(description: , ingredient: )
  @dose.cocktail = @cocktail

  cocktail.save
  base_id += 1
end
