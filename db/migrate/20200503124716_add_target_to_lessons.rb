class AddTargetToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :target, :text
    add_column :lessons, :content, :text
  end
end
