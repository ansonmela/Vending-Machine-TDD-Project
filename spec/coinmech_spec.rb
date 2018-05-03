require 'coinmech'

describe CoinMech do

	let(:coin_mech) {CoinMech.new}

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
end
