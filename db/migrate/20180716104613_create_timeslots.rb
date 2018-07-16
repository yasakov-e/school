class CreateTimeslots < ActiveRecord::Migration[5.1]
  def change
    create_table :timeslots do |t|
      t.integer :day
      t.integer :number
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
