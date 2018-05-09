require 'coinmech'
require 'products'
require 'front_display'

class Vending_Machine
	attr_accessor :coin_mech


	def initialize
		@coin_mech = CoinMech.new
		@products = Products.new
		@front_display = Front_Display.new
	end

	def insert_coin_and_validate(coin_weight, coin_size)
		@coin_mech.is_coin_valid?(coin_weight, coin_size) # validate coin
	end
end


