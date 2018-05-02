class Products
	attr_accessor :products


	def initialize
		@products = Hash.new{|hsh, key| hsh[key] = [] }

		@products['Cola'].push(1.00)
		@products['Cola'].push(2)

		@products['Candy'].push(0.65)
		@products['Candy'].push(2)

		@products['Chips'].push(0.50)
		@products['Chips'].push(2)
	end
end