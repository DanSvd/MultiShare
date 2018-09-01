class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :rooms, [:user_id, :created_at]
  end
end
