class AddSpoonacularIdToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :spoonacular_id, :integer
  end
end
