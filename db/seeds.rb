# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'uri'
require 'net/http'
require 'openssl'
require 'faker'

puts "Destroying database..."
Recipe.delete_all
Favourite.delete_all


# def create_recipes
50.times do
  recipe = Recipe.new
  recipe.title = Faker::Food.dish
  recipe.image_url = Faker::Avatar.image
  recipe.missed_ingredients = [Faker::Food.ingredient + Faker::Food.ingredient]
  recipe.used_ingredients = [Faker::Food.ingredient + Faker::Food.ingredient]
  recipe.missed_ingredient_count = rand(1..10)
  recipe.used_ingredient_count = rand(1..10)
  recipe.missed_ingredient_count = rand(1..10)
  recipe.save!
  puts "#{recipe.title} saved"
end

puts "Database updated!"


# # SEARCH BY INGREDIENT
# search format tomato%2Cpotato%2Csausage

# def search_by_ingredient(ingredients)
#   # ingredients = ["apple", "flour", "sugar"]
#   # ingredient_list = "apple,flour,sugar"
#   ingredient_list = ingredients.join(",")
#   puts ingredient_list
#   # url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?ingredients=#{ingredient_list}&number=5&ignorePantry=true&ranking=1")

#   # http = Net::HTTP.new(url.host, url.port)
#   # http.use_ssl = true
#   # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

#   # request = Net::HTTP::Get.new(url)
#   # request["X-RapidAPI-Key"] = 'e7f027f352msh98c9ac64f8a37fdp133f57jsnecb37450e34c'
#   # request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

#   # response = http.request # => Class = Net::HTTPOK
#   # # plain_text = response.read_body # => JSON
#   # parsed_data = JSON.parse(response.read_body) # => Parsing the JSON
#   # puts parsed_data[0]["title"] # =>
# end



# # GET RECIPE INFO

# recipe_info_url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/479101/information")

# http = Net::HTTP.new(recipe_info_url.host, recipe_info_url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# recipe_info_request = Net::HTTP::Get.new(recipe_info_url)
# request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
# request["X-RapidAPI-Key"] = ENV['SPOONACULAR_API_KEY']

# recipe_info_response = http.request(request)
# puts recipe_info_response.read_body


# def get_recipe
#   title =
#   extended_ingredients =
#   instructions =
#   image_url =
#   ready_in_minutes =
# end
