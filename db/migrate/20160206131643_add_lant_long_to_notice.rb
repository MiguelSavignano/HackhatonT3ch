class AddLantLongToNotice < ActiveRecord::Migration
  def change
    add_column :notices, :latitude, :string
    add_column :notices, :longitude, :string
  end
end
