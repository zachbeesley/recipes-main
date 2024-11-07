class AddAmountToIngredients < ActiveRecord::Migration[7.2]
  def change
    add_column :ingredients, :amount, :float
  end
end
