class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.string :number
      t.integer :room_type
      t.integer :price
      t.integer :status

      t.timestamps
    end
  end
end
