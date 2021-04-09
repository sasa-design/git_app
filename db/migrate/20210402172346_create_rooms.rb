class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :area
      t.string :genre
      t.string :artist
      t.date :date
      t.time :time
      t.text :comment

      t.timestamps
    end
  end
end
