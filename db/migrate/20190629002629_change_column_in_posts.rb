class ChangeColumnInPosts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :posts, :description, :content
  	change_column :posts, :content, :text
  end
end
