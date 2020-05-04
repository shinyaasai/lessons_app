class ChangeColumnsAddNotnullOnLessons < ActiveRecord::Migration[5.2]
  def change
    change_column :lessons, :title, :string, default: "", null: false
    change_column :lessons, :target, :text, null: false
    change_column :lessons, :content, :text, null: false
  end
end
