require 'coinmech'

describe CoinMech do

	class self::Coins

		def initialize
			@quarter = 0.25
			@nickel = 0.05
			@dime = 0.10
		end
	end

	let(:coin_mech) {CoinMech.new}
	let(:coins) {self.class::Coins.new}

	describe "#initialize" do 
		it "should have a total counter set to 0 upon instantiating" do 
			expect(coin_mech.total).to eq(0)
		end

		it "should have an empty return queue upon instantiating" do 
			expect(coin_mech.return_queue).to eq([])
		end

		it "should have an empty coin box upon instantiating" do 
			expect(coin_mech.coin_box).to eq([])
		end
	end

	describe "#is_coin_valid?" do 
		it "should detect weight and size of a coin, like a quarter, and determine validity and type" do
			expect(coin_mech.is_coin_valid?(5.670, 0.955)).to eq("Valid Quarter")
		end

		it "should detect weight and size of a coin, like a nickel, and determine validity and type" do 
			expect(coin_mech.is_coin_valid?(5.000, 0.835)).to eq("Valid Nickel")
		end

		it "should detect weight and size of a coin, like a dime, and determine validity and type" do 
			expect(coin_mech.is_coin_valid?(2.268, 0.705)).to eq("Valid Dime")
		end

		it "should push the valid coin type to the coin box upon successful validation" do 
			coin_mech.is_coin_valid?(5.670, 0.955)
			expect(coin_mech.coin_box.join).to eq("Quarter")
		end
	end
end
