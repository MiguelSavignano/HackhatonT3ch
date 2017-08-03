class AddUserToNotice < ActiveRecord::Migration[5.0]
  def change
    add_reference :notices, :user, index: true, foreign_key: true
  end
end
