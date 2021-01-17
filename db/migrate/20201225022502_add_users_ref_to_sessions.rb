class AddUsersRefToSessions < ActiveRecord::Migration[6.0]
  def change
  	remove_column :sessions, :user_id, :integer
  	add_reference :sessions, :user, foreign_key: true
  end
end
