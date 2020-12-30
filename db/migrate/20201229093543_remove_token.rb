class RemoveToken < ActiveRecord::Migration[6.0]
  def change
  	remove_column :users, :token
  end
end
