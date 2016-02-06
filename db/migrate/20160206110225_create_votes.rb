class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :user_id
      t.string :notice_id

      t.timestamps null: false
    end
  end
end
