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

	def set_to_default_message
		@message = "INSERT COIN"
	end

	def display_current_total(total)
		@message = total
	end

	def sold_out_message
		@message = "SOLD OUT"
	end

	def exact_change_only_message
		@message = "EXACT CHANGE ONLY"
	end
end