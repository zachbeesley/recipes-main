class CreateIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :ingredients do |t|
      t.text :content
      t.text :amount
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
