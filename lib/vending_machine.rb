require 'coinmech'
require 'products'
require 'front_display'

class Vending_Machine
	attr_accessor :coin_mech, :items


	def initialize
		@coin_mech = CoinMech.new
		@products = Products.new
		@front_display = Front_Display.new
	end

	def insert_coin_and_validate(coin_weight, coin_size)
		@coin_mech.is_coin_valid?(coin_weight, coin_size) # validate coin
	end

	def update_total_after_validation
		if coin_mech.coin_box.length > 1
			@coin_mech.update_total
		end
	end

	def display_message
		if coin_mech.total == 0
			@front_display.message = @front_display.set_to_default_message
		else
			@front_display.display_current_total(coin_mech.total)
		end
	end

	def select_product(item)
		@items = @products.products[item]
	end

end


