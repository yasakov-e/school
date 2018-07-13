class CreateAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
      t.integer :points
      t.boolean :attendance

      t.timestamps
    end
  end
end
