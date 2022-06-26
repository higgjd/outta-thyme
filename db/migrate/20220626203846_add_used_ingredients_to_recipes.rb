class AddUsedIngredientsToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :used_ingredients, :text, array: true, default: []
  end
end
