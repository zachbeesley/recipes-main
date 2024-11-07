class AddServesToRecipes < ActiveRecord::Migration[7.2]
  def change
    add_column :recipes, :serves, :integer
  end
end
