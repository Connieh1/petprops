class RemoveColumnsFromPets < ActiveRecord::Migration[5.2]
  def change
  	remove_column :pets, :category
  	remove_column :pets, :classification
  end
end
