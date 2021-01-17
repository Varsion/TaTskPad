class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
    	t.string :title
    	t.text	 :desc
    	t.string :group
    	t.string :color

    	# from 发布人 to 执行人
    	t.integer :from
    	t.integer :to

    	t.date    :start
    	t.date    :end

    	t.timestamps
    end
  end
end
