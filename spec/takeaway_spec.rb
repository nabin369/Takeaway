require_relative '../lib/takeaway'

describe 'Takeaway' do 

	let(:takeaway) { Takeaway.new}

	context 'checks if the dish is available' do

		it 'displays the menu' do
			expect(takeaway.menu).to eq(takeaway.menu)
		end

		it 'returns error if the dish is not in the menu' do
			expect{takeaway.check_dishes(['Pizza','Roti'])}.to raise_error("Pizza not available")
		end

		it 'returns no error if the dish is in the menu' do
			expect{takeaway.check_dishes(['Tofu_steak'])}.not_to raise_error
		end
	end

	context 'checks for total amount' do

		it 'returns total amount 4 with 1 dish' do
			expect(takeaway.calculate_total_amount(['Tofu_steak'], [1])).to eq(4)
		end

		it 'returns total amount 11 with 2 dish' do
			expect(takeaway.calculate_total_amount(['Tofu_steak', "Edamame"], [2,1])).to eq(11)
		end

		it 'returns total amount 21 with 3 dishes' do
			expect(takeaway.calculate_total_amount(['Tofu_steak', "Edamame", "Harumaki"], [2,1,2])).to eq(21)
		 end
	end

	context 'sends sms message' do 

		it 'successful for 1 order with correct total amount' do
			takeaway.stub(:send_text_message).and_return(true)

			expect(takeaway.place_order(['Tofu_steak'], [3], 12))
		end

		it 'successful for 3 order with correct total amount' do
			takeaway.stub(:send_text_message).and_return(true)

			expect(takeaway.place_order(['Edamame', 'Soft_cell_crab', 'Harumaki'], [1,2,3], 34))
		end

		it 'raise error for order with incorrect total amount' do
			takeaway.stub(:send_text_message).and_return(true)

			expect{takeaway.place_order(['Tofu_steak', 'Edamame'], [1, 2], 12)}.to raise_error
		end
	end

end