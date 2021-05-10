class AddForeignKeyToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :user_id, :bigint
    add_foreign_key :articles, :users
  end
end
