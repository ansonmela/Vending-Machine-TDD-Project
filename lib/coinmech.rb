class CoinMech
	attr_accessor :total, :return_queue, :coin_box

	def initialize
		@total = 0
		@return_queue = []
		@coin_box = []
	end

	def is_coin_valid?(weight, size)
		if weight == 5.670 && size == 0.955
			return "Valid Quarter"
		elsif weight == 5.000 && size == 0.835
			return "Valid Nickel"
		end

	end
end