class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :category
      t.string :classification
      t.string :species
      t.string :breed

      t.timestamps
    end
  end
end
