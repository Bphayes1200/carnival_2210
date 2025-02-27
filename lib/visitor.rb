class Visitor
  attr_reader :name, 
              :height,
              :preferences 

  def initialize(name, height, spending_money)
    @name = name 
    @height = height 
    $spending_money = spending_money
    @preferences = []
  end 

  def spending_money
    if $spending_money.class == String
       $spending_money.delete_prefix('$').to_i
    else 
      $spending_money
    end 
  end 

  def add_preference(preference)
    @preferences << preference
  end 

  def tall_enough?(requirement)
    if @height >= requirement 
      true
    else  
      false
    end 
  end 
end
