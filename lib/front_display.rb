class Front_Display
	attr_accessor :message

	def initialize
		@message = "INSERT COIN"
	end

	def show_price(price)
		@message = "PRICE: %.2f" % [price]
	end

	def thank_you_display
		@message = "THANK YOU"
	end
end