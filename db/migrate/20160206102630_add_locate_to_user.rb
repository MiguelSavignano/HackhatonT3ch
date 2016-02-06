class AddLocateToUser < ActiveRecord::Migration
  def change
    add_column :users, :locate, :string
  end
end
