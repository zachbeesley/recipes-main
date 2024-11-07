class AddDescriptionToRecipe < ActiveRecord::Migration[7.2]
  def change
    add_column :recipes, :description, :text
  end
end
