class CreateUserShifts < ActiveRecord::Migration
  def change
    create_table :user_shifts do |t|
      t.integer :user_id
      t.integer :shift_id
      t.integer :hours_worked

      t.timestamps
    end
  end
end
