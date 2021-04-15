class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user
      t.integer :age
      t.string :sex
      t.string :living
      t.integer :height
      t.string :look
      t.string :type
      t.string :holiday
      t.string :smoke
      t.string :drink
      t.text :detail

      t.timestamps
    end
  end
end
