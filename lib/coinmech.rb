class CoinMech
	attr_accessor :total, :return_queue, :coin_box

	def initialize
		@total = 0
		@return_queue = []
		@coin_box = []
	end

	def is_coin_valid?(weight, size)
		if weight == 5.670 && size == 0.955
			@coin_box.push("Quarter")
			return "Valid Quarter"
		elsif weight == 5.000 && size == 0.835
			@coin_box.push("Nickel")
			return "Valid Nickel"
		elsif weight == 2.268 && size == 0.705
			@coin_box.push("Dime")
			return "Valid Dime"
		else
			@return_queue.push("Invalid Coin")
			return "Invalid Coin"
		end
	end

	def update_total
		@coin_box.each do |coin|

			if coin == "Quarter"
				@total += 0.25
			elsif coin == "Dime"
				@total += 0.10
			elsif coin == "Nickel"
				@total += 0.05
			end
		end
	end

	def return_total
		@total
	end

	def return_coins
		@coin_box.pop(@coin_box.size)
		@total -= @total
	end

	def invalid_coin_return
		@return_queue.pop(@return_queue.size).join(" ")
	end

	def make_change(total_amount_input, price_of_product)
		change = total_amount_input - price_of_product
		return "%.2f" % change
	end
end