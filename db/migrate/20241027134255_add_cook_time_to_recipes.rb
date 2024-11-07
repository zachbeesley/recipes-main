class AddCookTimeToRecipes < ActiveRecord::Migration[7.2]
  def change
    add_column :recipes, :cook_time, :integer
  end
end
