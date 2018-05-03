require 'coinmech'

describe CoinMech do

	let(:coin_mech) {CoinMech.new}

	describe "#initialize" do 
		it "should have a total counter set to 0 upon instantiating" do 
			expect(coin_mech.total).to eq(0)
		end
	end
end
