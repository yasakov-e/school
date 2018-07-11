class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :topic
      t.text :description
      t.text :links
      t.date :date

      t.timestamps
    end
  end
end
