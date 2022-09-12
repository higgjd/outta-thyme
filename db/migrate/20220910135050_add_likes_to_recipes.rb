class AddLikesToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :likes, :integer
  end
end
