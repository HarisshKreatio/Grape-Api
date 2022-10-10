class RemoveArticleIdFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_index :authors, :article_id
    remove_column :authors, :article_id
  end
end
