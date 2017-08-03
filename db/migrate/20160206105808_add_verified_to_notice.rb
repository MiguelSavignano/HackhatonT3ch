class AddVerifiedToNotice < ActiveRecord::Migration[5.0]
  def change
    add_column :notices, :verified, :boolean
  end
end
