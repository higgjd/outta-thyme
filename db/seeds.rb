# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# require 'uri'
# require 'net/http'
# require 'openssl'
# require 'faker'
# require "ostruct"
# require 'pry-byebug'

puts "Destroying database..."
Recipe.delete_all
puts "All recipes deleted"
Favourite.delete_all
puts "All favourites deleted"

# FAKED DATA

# # def create_recipes
# # 50.times do
# #   recipe = Recipe.new
# #   recipe.title = Faker::Food.dish
# #   recipe.instructions = Faker::Food.description
# #   recipe.image_url = Faker::Avatar.image
# #   recipe.missed_ingredients = [Faker::Food.ingredient + Faker::Food.ingredient]
# #   recipe.used_ingredients = [Faker::Food.ingredient + Faker::Food.ingredient + Faker::Food.ingredient]
# #   recipe.missed_ingredient_count = 2
# #   recipe.used_ingredient_count = 3
# #   recipe.save!
# #   puts "#{recipe.title} saved"
# # end
# # puts "Database updated!"





# def search_by_ingredient(ingredients)
#   # ingredients = ["apple", "flour", "sugar"]
#   # ingredient_list = "apple,flour,sugar"
#   # search format tomato%2Cpotato%2Csausage

#   ingredient_list = ingredients.join("%2C")
#   url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?ingredients=#{ingredient_list}&number=6&ignorePantry=true&ranking=1")
#   # binding.pry
#   http = Net::HTTP.new(url.host, url.port)
#   http.use_ssl = true
#   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

#   request = Net::HTTP::Get.new(url)
#   request["X-RapidAPI-Key"] = ENV['SPOONACULAR_API_KEY']
#   request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

#   response = http.request(request)
#   parsed_hash = JSON.parse(response.read_body, object_class: OpenStruct) # => array of 5 recipe hashes
# end

# # puts search_by_ingredient("apple")

# def get_instructions(recipe_id)
#   url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{recipe_id}/analyzedInstructions?stepBreakdown=true")

#   http = Net::HTTP.new(url.host, url.port)
#   http.use_ssl = true
#   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

#   request = Net::HTTP::Get.new(url)
#   request["X-RapidAPI-Key"] = ENV['SPOONACULAR_API_KEY']
#   request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

#   response = http.request(request).read_body
#   parsed_hash = JSON.parse(response, object_class: OpenStruct)
#   # parsed_hash[0].steps  # => a hash of steps
# end

# # p get_instructions(72)

# def create_recipe(ingredient)
#   recipes = search_by_ingredient(ingredient)
#   recipes.each do |recipe|
#     instructions_hash = get_instructions(recipe.id)

#     new_recipe = Recipe.new(
#       title: recipe.title,
#       instructions: instructions_hash,
#       image_url: recipe.image,
#       # ready_in_minutes: ,
#       used_ingredient_count: recipe.usedIngredientCount,
#       missed_ingredient_count: recipe.missedIngredientCount,
#       missed_ingredients: recipe.missedIngredientsusedIngredients,
#       used_ingredients: recipe.usedIngredients,
#       unused_ingredients: recipe.unusedIngredients
#     )
#     new_recipe.save!
#     puts "Created recipe #{new_recipe.title}!"
#   end
# end

# create_recipe(["sugar","milk"])


# # p ["sugar","milk"].join("%2")

# # SEARCH BY INGREDIENT






# # # GET RECIPE INFO

# # recipe_info_url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/479101/information")

# # http = Net::HTTP.new(recipe_info_url.host, recipe_info_url.port)
# # http.use_ssl = true
# # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# # recipe_info_request = Net::HTTP::Get.new(recipe_info_url)
# # request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
# # request["X-RapidAPI-Key"] = ENV['SPOONACULAR_API_KEY']

# # recipe_info_response = http.request(request)
# # puts recipe_info_response.read_body


# # def get_recipe
# #   title =
# #   extended_ingredients =
# #   instructions =
# #   image_url =
# #   ready_in_minutes =
# # end
