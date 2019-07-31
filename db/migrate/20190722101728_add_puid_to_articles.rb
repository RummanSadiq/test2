class AddPuidToArticles < ActiveRecord::Migration[5.2]
  def change
            add_column :articles, :puid, :string
  end
end
