class AddTitleToPosts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :posts, :name, :title
  end
end
