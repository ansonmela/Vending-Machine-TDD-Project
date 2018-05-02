require 'products'

describe Products do 
	let(:products) {Products.new}

	describe "#initialize" do 

		it "should have cola that costs $1.00" do
			expect(products.products["Cola"][0]).to eq(1.00)
		end
		
		it "should have 2 colas in the vending machine upon instantiating" do 
			expect(products.products["Cola"][1]).to eq(2)
		end

	end
end