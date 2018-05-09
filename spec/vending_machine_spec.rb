require 'spec_helper'
require 'vending_machine'

describe Vending_Machine do 
	let(:vending_machine) {Vending_Machine.new}
	let(:coins) {Coins.new}

	describe "#insert_coins" do 
		it "should validate a coin" do
			expect(vending_machine.insert_coin_and_validate(coins.quarter[0], coins.quarter[1])).to eq("Valid Quarter")
		end

		it "should push the coin to the coin_box upon validation" do 
			vending_machine.insert_coin_and_validate(coins.quarter[0], coins.quarter[1])
			vending_machine.insert_coin_and_validate(coins.dime[0], coins.dime[1])

			expect(vending_machine.coin_mech.coin_box).to eq(["Quarter", "Dime"])
		end
	end
end

			

