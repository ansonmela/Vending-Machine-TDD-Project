require 'coinmech'

class Coins
	attr_accessor :quarter, :nickel, :dime
	def initialize
		# [weight, size, value]
		@quarter = [5.670, 0.955, 0.25]
		@nickel = [5.000, 0.835, 0.05]
		@dime = [2.268, 0.705, 0.10]
	end
end

describe CoinMech do

	let(:coin_mech) {CoinMech.new}
	let(:coins) {Coins.new}

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
			expect(coin_mech.is_coin_valid?(coins.quarter[0], coins.quarter[1])).to eq("Valid Quarter")
		end

		it "should detect weight and size of a coin, like a nickel, and determine validity and type" do 
			expect(coin_mech.is_coin_valid?(coins.nickel[0], coins.nickel[1])).to eq("Valid Nickel")
		end

		it "should detect weight and size of a coin, like a dime, and determine validity and type" do 
			expect(coin_mech.is_coin_valid?(coins.dime[0], coins.dime[1])).to eq("Valid Dime")
		end

		it "should push the valid coin type to the coin box upon successful validation" do 
			coin_mech.is_coin_valid?(coins.quarter[0], coins.quarter[1])
			expect(coin_mech.coin_box.join).to eq("Quarter")
		end

		it "should push an invalid coin to the return queue" do 
			coin_mech.is_coin_valid?(2.500, 0.750)
			expect(coin_mech.return_queue.join).to eq("Invalid Coin")
		end
	end

	describe "#update_total" do 
		it "should update the total for every valid coin inserted, like a quarter" do 
			coin_mech.is_coin_valid?(coins.quarter[0], coins.quarter[1])
			coin_mech.update_total
			expect(coin_mech.total).to eq(0.25)
		end

		it "should update the total for every valid coin inserted, like a dime" do
			coin_mech.is_coin_valid?(coins.dime[0], coins.dime[1])
			coin_mech.update_total
			expect(coin_mech.total).to eq(0.10)
		end

		it "should update the total for every valid coin inserted, like a nickel" do 
			coin_mech.is_coin_valid?(coins.nickel[0], coins.nickel[1])
			coin_mech.update_total
			expect(coin_mech.total).to eq(0.05)
		end

		it "should update the total for every coin inserted" do 
			coin_mech.coin_box.push("Quarter", "Quarter", "Dime")
			coin_mech.update_total
			expect(coin_mech.total).to eq(0.60)
		end
	end

	describe "#return_total" do 
		it "should return the current total" do 
			expect(coin_mech.return_total).to eq(coin_mech.total)
		end
	end

	describe "#return_coins" do 
		it "should return all valid coins inserted" do 
			coin_mech.coin_box.push("Quarter", "Quarter", "Dime", "Nickel")
			coin_mech.return_coins
			expect(coin_mech.coin_box).to eq([])
		end

	end

end
