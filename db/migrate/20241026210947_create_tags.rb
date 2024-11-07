class CreateTags < ActiveRecord::Migration[7.2]
  def change
    create_table :tags do |t|
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
