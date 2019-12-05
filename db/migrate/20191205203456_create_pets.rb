class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.integer :owner_id
      t.string :name
      t.string :breed
      t.string :color
      t.boolean :checked_in
      t.date :checked_in_date

      t.timestamps
    end
  end
end
