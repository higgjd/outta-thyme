class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:spoonacular_id])
  end


  def search
    # call API with given search term
    results = search_by_ingredient(params[:ingredient]) # => array of 5 recipe hashes
    # instantiate recipes for each result
    @new_recipes = create_recipe(results)
  end

  def search_by_ingredient(ingredient)
    url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?ingredients=#{ingredient}&number=6&ignorePantry=true&ranking=1")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = ENV['SPOONACULAR_API_KEY']
    request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

    response = http.request(request)
    parsed_hash = JSON.parse(response.read_body, object_class: OpenStruct) # => array of 5 recipe hashes
  end

  def get_instructions(recipe_id)
    url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{recipe_id}/analyzedInstructions?stepBreakdown=true")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = ENV['SPOONACULAR_API_KEY']
    request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

    response = http.request(request).read_body
    parsed_hash = JSON.parse(response, object_class: OpenStruct)
    # parsed_hash[0].steps  # => a hash of steps
  end


  def create_recipe(recipes)
    new_recipes = []
    recipes.each do |recipe|
      instructions_hash = get_instructions(recipe.id)

        new_recipe = Recipe.new(
        title: recipe.title,
        instructions: instructions_hash,
        image_url: recipe.image,
        # ready_in_minutes: ,
        used_ingredient_count: recipe.usedIngredientCount,
        missed_ingredient_count: recipe.missedIngredientCount,
        missed_ingredients: recipe.missedIngredientsusedIngredients,
        used_ingredients: recipe.usedIngredients,
        unused_ingredients: recipe.unusedIngredients,
        spoonacular_id: recipe.id
      )
      new_recipes << new_recipe
    end
    return new_recipes
  end
end
