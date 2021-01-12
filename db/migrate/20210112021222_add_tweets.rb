class AddTweets < ActiveRecord::Migration[6.0]
  def change
  	create_table :tweets do |t|

    	t.string :action

    	t.date :time

    	t.timestamps
    end

    add_reference :tweets, :session, foreign_key: true
    add_reference :tweets, :task, foreign_key: true
  end
end
