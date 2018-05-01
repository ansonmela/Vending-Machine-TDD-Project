require 'front_display'

describe Front_Display do 
	let(:front_display) {Front_Display.new}

	describe "#initialize" do 

		it "should read 'INSERT COIN' when initialized" do 
			expect(front_display.message).to eq('INSERT COIN')
		end
	end
end