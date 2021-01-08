class Task < ApplicationRecord
	belongs_to :session
	belongs_to :tenant



	private
		def task_id
			self.id = "A ID"
		end
end