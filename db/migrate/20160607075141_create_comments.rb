class CreateComments < ActiveRecord::Migration
  def change
      create_table :comments do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.integer :entry_id

      t.timestamps(null: false)
    end
  end
end
