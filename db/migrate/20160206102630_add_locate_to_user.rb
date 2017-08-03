class AddLocateToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :locate, :string
  end
end
