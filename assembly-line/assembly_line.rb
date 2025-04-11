class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    success_rate = 
      if @speed <= 4
        1
      elsif @speed <= 8
        0.9
      elsif @speed == 9
        0.8
      elsif @speed == 10
        0.77
      end  
  
    @speed * MIN_PRODUCE_CARS_PER_HOUR * success_rate 
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end

  private

  MIN_PRODUCE_CARS_PER_HOUR = 221
end
