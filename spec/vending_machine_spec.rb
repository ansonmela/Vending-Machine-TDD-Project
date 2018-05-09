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

		it "should update display when a valid coin is inserted" do
			expect(vending_machine.display_message).to eq("INSERT COIN")

			vending_machine.coin_mech.coin_box.push("Quarter", "Quarter")
			vending_machine.update_total_after_validation

			expect(vending_machine.display_message).to eq(0.50)
		end
	end

	describe "#select_product" do 
		it "should have products like cola" do 
			vending_machine.select_product("Cola")
			expect(vending_machine.items.empty?).to eq(false)
		end

		it "should have products like chips" do 
			vending_machine.select_product("Chips")
			expect(vending_machine.items.empty?).to eq(false)
		end

		it "should have products like candy" do 
			vending_machine.select_product("Candy")
			expect(vending_machine.items.empty?).to eq(false)
		end

		it "should show the customer the product price if no coins have been inserted" do 
			expect(vending_machine.display_message).to eq("INSERT COIN")
			expect(vending_machine.select_product("Cola")).to eq("PRICE: 1.00")
		end

		it "should not dispense the product if there are insufficient funds inputted into the vending machine" do 
			vending_machine.coin_mech.coin_box.push("Quarter", "Quarter")
			vending_machine.update_total_after_validation

			expect(vending_machine.display_message).to eq(0.50)
			expect(vending_machine.select_product("Cola")).to eq("PRICE: 1.00")
		end
	end

	describe "#check_dispenser" do 
		it "should pop the product out to the customer" do 
			vending_machine.products.dispenser.push("Chips")
			expect(vending_machine.check_dispenser).to eq("Chips")
		end
	end


	it "should dispense the product like chips if enough money has been inserted" do 
		vending_machine.insert_coin_and_validate(coins.quarter[0], coins.quarter[1])
		vending_machine.insert_coin_and_validate(coins.quarter[0], coins.quarter[1])

		vending_machine.update_total_after_validation

		expect(vending_machine.display_message).to eq(0.50)

		vending_machine.select_product("Chips")
		expect(vending_machine.check_dispenser).to eq("Chips")
	end

	it "should dispense the product like cola if enough money has been inserted and return change if applicable" do 
		vending_machine.coin_mech.coin_box.push("Quarter", "Quarter", "Dime", "Nickel", "Nickel", "Dime", "Dime", "Dime", "Dime")

		vending_machine.update_total_after_validation

		expect(vending_machine.display_message).to eq(1.10)
		vending_machine.select_product("Cola")
		expect(vending_machine.check_dispenser).to eq("Cola")

		expect(vending_machine.coin_mech.make_change(1.10, 1.00)).to eq("0.10")
	end
end

			

