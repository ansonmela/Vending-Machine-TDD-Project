require 'front_display'

describe Front_Display do 
	let(:front_display) {Front_Display.new}

	describe "#initialize" do 

		it "should read 'INSERT COIN' when initialized" do 
			expect(front_display.message).to eq('INSERT COIN')
		end
	end

	describe "#show_price" do 

		it "should show the price of cola on the display" do 
			expect(front_display.show_price(1.00)).to eq("PRICE: 1.00")
		end

		it "should show the price of candy on the display" do 
			expect(front_display.show_price(0.65)).to eq("PRICE: 0.65")
		end

		it "should show the price of chips on the display" do 
			expect(front_display.show_price(0.50)).to eq("PRICE: 0.50")
		end
	end

	describe "#thank_you_display" do 
		it "should display 'THANK YOU'" do 
			expect(front_display.thank_you_display).to eq("THANK YOU")
		end
	end
end