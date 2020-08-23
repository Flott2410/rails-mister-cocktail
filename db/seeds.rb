# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'


# puts "Create ingredients"

# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# ingredients_serialized = open(url).read
# ingredients = JSON.parse(ingredients_serialized)
# ingredients_array = ingredients["drinks"]
# ingredients_array.each do |ingred|
#   ingriedent = Ingredient.create!(name: ingred["strIngredient1"])
# end

# puts "Successfully created ingredients"


puts "Create cocktails"
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

base_id = 11000
25.times do
  url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{base_id}"
  cocktail_serialized = open(url).read
  cocktail_s = JSON.parse(cocktail_serialized)
  cocktail_array = cocktail_s["drinks"]
  cocktail_hash = cocktail_array.first

  cocktail = Cocktail.new(
    name: cocktail_hash["strDrink"]
    # image_url: cocktail_hash["strDrinkThumb"]
  )

  # byebug
  file = URI.open("#{cocktail_hash["strDrinkThumb"]}")
  cocktail.photo.attach(io: file, filename: "#{base_id}.png", content_type: 'image/png')
  cocktail.save!
  base_id += 1

  # get doses pairs: ingredients + dose_description
  dose_pairs = []
  x = 1
  14.times do
    dose_pairs << [cocktail_hash["strMeasure#{x}"], cocktail_hash["strIngredient#{x}"]]
    x += 1
  end

  # iterate over dose array to create doses that should belong to a cocktail - filter out 0 values
  # dose_pairs is array of arrays
  dose_pairs.each do |item|
    if item[1] != nil
      # byebug
      ig = Ingredient.create!(name: item[1])
      if item[0] == nil
        item[0] = "personal preference"
      end
      dose = Dose.new(description: item[0], ingredient: ig)
      dose.cocktail = cocktail
      dose.save!
      # byebug
    end
  end
end

puts "30 Cocktails created!!!!"
