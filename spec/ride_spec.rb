require './lib/visitor'

RSpec.describe Visitor do 
  describe "initialize" do 
    it 'will exist and have attributes' do 
      visitor = Visitor.new('Bruce', 54, '$10')

      expect(visitor).to be_a(Visitor)
      expect(visitor.name).to eq("Bruce")
      expect(visitor.height).to eq(54)
      expect(visitor.spending_money).to eq(10)
      expect(visitor.preferences).to eq([])
    end 
  end 

  describe "add_preference" do 
    it 'will add a preference' do 
      visitor = Visitor.new('Bruce', 54, '$10')
      visitor.add_preference(:gentle)
      visitor.add_preference(:water)
      
      expect(visitor.preferences).to eq([:gentle, :water])
    end 
  end 

  describe "tall enough" do 
    it 'will check to see if a visitor is tall enough' do 
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      expect(visitor1.tall_enough?(54)).to eq(true)
      expect(visitor2.tall_enough?(54)).to eq(false)
      expect(visitor3.tall_enough?(54)).to eq(true)
      expect(visitor1.tall_enough?(64).to eq(false))
    end 
  end 

end 