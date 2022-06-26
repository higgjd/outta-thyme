class RemoveExtendedIngredientsFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :extended_ingredients, :string
  end
end
