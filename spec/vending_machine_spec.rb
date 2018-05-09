require 'spec_helper'
require 'vending_machine'

describe Vending_Machine do 
	let(:vending_machine) {Vending_Machine.new}
	let(:coins) {Coins.new}

	describe "#insert_coins" do 
		it "should validate a coin" do
			expect(vending_machine.insert_coins(coins.quarter[0], coins.quarter[1])).to eq("Valid Quarter")
		end
	end
end

			

