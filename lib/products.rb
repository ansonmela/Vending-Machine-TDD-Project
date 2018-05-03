class Products
	attr_accessor :products, :dispenser


	def initialize
		@products = Hash.new{|hsh, key| hsh[key] = [] }

		@products['Cola'].push(1.00)
		@products['Cola'].push(2)

		@products['Candy'].push(0.65)
		@products['Candy'].push(2)

		@products['Chips'].push(0.50)
		@products['Chips'].push(2)

		@dispenser = []
	end


	def dispense_product(item, inserted_coins)
		if !@products[item]
			return "NOT FOUND"
		elsif inserted_coins < @products[item][0]
			return "INSUFFICIENT FUNDS"
		else
			@dispenser.push(item)
		end
	end
end