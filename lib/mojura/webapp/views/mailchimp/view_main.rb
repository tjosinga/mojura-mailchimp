module MojuraWebApp

	class MailChimpView < BaseView

		def initialize(options = {})
			super
		end

	end

	WebApp.register_view('mailchimp', MailChimpView)

end