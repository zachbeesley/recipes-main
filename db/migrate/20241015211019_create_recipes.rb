class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :dish_name
      t.string :dish_type
      t.integer :number_of_likes

      t.timestamps
    end
  end
end
