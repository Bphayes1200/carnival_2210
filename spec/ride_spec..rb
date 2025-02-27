require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do  
  describe "initialize" do 
    it 'will exist and have attributes' do  
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

      expect(ride1.name).to eq("Carousel")
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
      expect(ride1.total_revenue).to eq(0)
    end 
  end 

  describe 'board_rider' do 
    it 'will board a rider' do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)
# require 'pry'; binding.pry

      expect(ride1.rider_log).to be_a(Hash)
      expect(ride1.rider_log.include?(visitor1)).to eq(true)
      expect(ride1.rider_log.include?(visitor2)).to eq(true)
      expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})
      expect(ride1.total_revenue).to eq(3)
      expect(visitor2.spending_money).to eq(4)

    end 
  end 
end 