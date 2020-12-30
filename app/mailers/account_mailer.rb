class AccountMailer < ApplicationMailer

	def verify_account user
		@user = user

		mail to: user.email, subject: "Account Activation"
	end
end
