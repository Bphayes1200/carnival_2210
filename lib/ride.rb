class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement, 
              :total_revenue,
              :rider_log
    
  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end 

  def board_rider(rider)
    total_amount_per_rider = rider_log.keys.find_all {|visitor| visitor = rider}
    final_cost = total_amount_per_rider.count * @admission_fee
    @rider_log[rider] = (final_cost)
    @total_revenue = @rider_log.values.sum
  end 

end
