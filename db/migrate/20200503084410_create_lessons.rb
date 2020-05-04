class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :practice_field, null: false, default: ""
      t.integer :level
      t.integer :price
      t.text :message

      t.timestamps
    end
  end
end
