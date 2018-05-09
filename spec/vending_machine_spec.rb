require 'spec_helper'
require 'vending_machine'

describe Vending_Machine do 
	let(:vending_machine) {Vending_Machine.new}
	let(:coins) {Coins.new}

	describe "#insert_coins" do 
		it "should validate a coin" do
			expect(vending_machine.insert_coin_and_validate(coins.quarter[0], coins.quarter[1])).to eq("Valid Quarter")
		end

		it "should reject invalid coins and push to return queue" do 
			vending_machine.insert_coin_and_validate(2.500, 0.750)
			expect(vending_machine.coin_mech.return_queue.join).to eq("Invalid Coin")
		end

		it "should push the coin to the coin_box upon validation" do 
			vending_machine.insert_coin_and_validate(coins.quarter[0], coins.quarter[1])
			vending_machine.insert_coin_and_validate(coins.dime[0], coins.dime[1])

			expect(vending_machine.coin_mech.coin_box).to eq(["Quarter", "Dime"])
		end
	end


	describe "#update_total_after_validation" do 
		it "should update the total upon validation of inserted coin" do
			vending_machine.insert_coin_and_validate(coins.quarter[0], coins.quarter[1])
			vending_machine.insert_coin_and_validate(coins.quarter[0], coins.quarter[1])

			vending_machine.update_total_after_validation

			expect(vending_machine.coin_mech.total).to eq(0.50)
		end
	end


	describe "#display_message" do 
		it "should display INSERT COIN when no coins are inserted" do
			expect(vending_machine.display_message).to eq("INSERT COIN")
		end
	end
end

			

