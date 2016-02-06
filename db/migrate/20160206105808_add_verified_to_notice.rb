class AddVerifiedToNotice < ActiveRecord::Migration
  def change
    add_column :notices, :verified, :boolean
  end
end
