class AddLantLongToNotice < ActiveRecord::Migration[5.0]
  def change
    add_column :notices, :latitude, :string
    add_column :notices, :longitude, :string
  end
end
