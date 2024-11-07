class AddPrepTimeToRecipes < ActiveRecord::Migration[7.2]
  def change
    add_column :recipes, :prep_time, :integer
  end
end
