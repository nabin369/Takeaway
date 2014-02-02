require 'rubygems'
require 'twilio-ruby'

class Takeaway

	ACCOUNT_SID = 'AC16f6fa9c426131bf9b7aebf3a0fecd37'
	AUTH_TOKEN = 'aaee7e72289dcf123bbfe3ff593d66d7'

	def initialize
		@menu = [
						{:dish => "Tofu_steak", :price => 4},
						{:dish => "Edamame", :price => 3},
						{:dish => "Soft_cell_crab", :price => 8},
						{:dish => "Harumaki", :price => 5},
						{:dish => "Ebi_tempura", :price => 7}
						]
	end


	def place_order(dishes, quantity, total_amount)
		check_dishes(dishes)
		calculate_total_amount(dishes, quantity)
		check_total_amount(total_amount)
		send_text_message
	end

	def check_dishes(dishes)
		dishes.each.with_index do |dish, i|
		raise "#{dish} not available" unless @menu.any? { |d| d[:dish] == dish}
		end
	end

	def check_total_amount(total_amount)
		raise "Total amount incorrect" unless @total_amount == total_amount
	end

	def calculate_total_amount(dishes, quantity)
		amt= []
		dishes.each.with_index do |dish, i|
		 	@menu.each {|m| amt << m[:price] * quantity[i] if m[:dish] == dish}
		end
		@total_amount = amt.inject { |x,y| x + y}
	end

	def send_text_message

		@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

		@client.account.sms.messages.create(
			:body => "Thank you! Your order was placed and will be delivered before 18:52",
			:to => "+44 7584485654",
			:from => "+44 1986232021")
	end

end



