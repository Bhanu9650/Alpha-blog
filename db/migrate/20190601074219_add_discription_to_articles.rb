class AddDiscriptionToArticles < ActiveRecord::Migration[5.2]
  def change
  	add_column :articles, :discription, :text
  	add_column :articles, :checked_at, :datetime
  	add_column :articles, :updated_at, :datetime
  end
end
