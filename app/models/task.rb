class Task < ApplicationRecord
	belongs_to :session
	belongs_to :tenant

	def finish
		self.status = true
		self.save
	end

	private
		def task_id
			self.id = "A ID"
		end
end