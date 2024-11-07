class AddValueToTags < ActiveRecord::Migration[7.2]
  def change
    add_column :tags, :value, :text
  end
end
