class RenameBodyToContent < ActiveRecord::Migration[7.2]
  def change
    rename_column :ingredients, :amount, :measurement
  end
end
