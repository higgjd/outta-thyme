class AddMissedIngredientsToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :missed_ingredients, :text, array: true, default: []
  end
end
