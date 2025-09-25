class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.string :code
      t.integer :guest_id
      t.integer :room_id
      t.date :check_in
      t.date :check_out
      t.integer :status
      t.integer :adults
      t.integer :children

      t.timestamps
    end
  end
end
