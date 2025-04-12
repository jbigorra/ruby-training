class LocomotiveEngineer
  def self.generate_list_of_wagons(*arguments)
    arguments
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first, second, locomotive, *wagon_ids = each_wagons_id
    
    [locomotive, *missing_wagons, *wagon_ids, first, second]
  end

  def self.add_missing_stops(route, **city_stops)
    {**route, stops: city_stops.values }
  end

  def self.extend_route_information(route, more_route_information)
    { **route, **more_route_information }
  end
end
