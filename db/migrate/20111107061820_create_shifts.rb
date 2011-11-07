class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.date :time
      t.integer :hours
      t.text :description

      t.timestamps
    end
  end
end
