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
		end
	end
end