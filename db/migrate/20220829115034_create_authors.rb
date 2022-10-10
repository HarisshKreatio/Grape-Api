class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.integer :article_id
      t.index :article_id
      t.timestamps
    end
  end
end
