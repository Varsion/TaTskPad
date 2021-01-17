class Tweet < ApplicationRecord
	# Session (who) Action (do) Task (what) -> Tweet


	def finish
		self.action = "finish"
		self.save
	end

	def pub
		self.action = "publish"
		self.save
	end

	def edit
		self.action = "edit"
		self.save
	end
end
