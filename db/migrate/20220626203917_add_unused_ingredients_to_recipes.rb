class AddUnusedIngredientsToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :unused_ingredients, :text, array: true, default: []
  end
end
