class RemovePriceToLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :price, :integer
    remove_column :lessons, :level, :integer
    remove_column :lessons, :message, :text
  end
end
