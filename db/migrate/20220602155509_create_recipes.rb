class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :extended_ingredients
      t.string :instructions
      t.string :image_url
      t.integer :ready_in_minutes

      t.timestamps
    end
  end
end
