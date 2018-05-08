require 'coinmech'
require 'products'
require 'front_display'

class Vending_Machine


	def initialize
		@coin_mech = CoinMech.new
		@products = Products.new
		@front_display = Front_Display.new
	end




end


