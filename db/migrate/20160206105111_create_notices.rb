class CreateNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :notices do |t|
      t.references :city, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
