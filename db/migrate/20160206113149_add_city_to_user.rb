class AddCityToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :city, index: true, foreign_key: true
  end
end
