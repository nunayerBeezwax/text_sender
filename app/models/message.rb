class Message < ActiveRecord::Base
	before_create :send_sms



private
	def send_sms
		response = RestClient::Request.new(
		:method => :post, 
		:url => 'https://api.twilio.com/2010-04-01/Accounts/AC436b69d9566e0de9ad64f8a4504de14a/Messages.json',
		:user => 'AC436b69d9566e0de9ad64f8a4504de14a',
		:password => '5427a8e5e23caf5269a4e6bc88bf6184', 
		:payload => { :Body => body, 
									:From => from, 
									:To => to }
									).execute
	end
end