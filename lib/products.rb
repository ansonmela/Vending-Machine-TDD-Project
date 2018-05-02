class Products
	attr_accessor :products


	def initialize
		@products = Hash.new{|hsh, key| hsh[key] = [] }

		@products['Cola'].push(1.00)
		@products['Cola'].push(2)
	end
end