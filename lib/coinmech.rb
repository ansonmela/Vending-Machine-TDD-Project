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
		end
	end

	def update_total
		if @coin_box.include?("Quarter")
			@total += 0.25
		end
	end
end