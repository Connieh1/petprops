class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :description
      t.belongs_to :user, foreign_key: true
      t.belongs_to :pet, foreign_key: true

      t.timestamps
    end
  end
end
