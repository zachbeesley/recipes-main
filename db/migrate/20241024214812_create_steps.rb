class CreateSteps < ActiveRecord::Migration[7.2]
  def change
    create_table :steps do |t|
      t.text :description
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
