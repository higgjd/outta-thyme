class AddUsedIngredientCountToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :used_ingredient_count, :integer
  end
end
