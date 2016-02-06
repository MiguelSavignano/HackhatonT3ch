class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :notice, index: true, foreign_key: true
      t.text :text
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.integer :rating

      t.timestamps null: false
    end
  end
end
