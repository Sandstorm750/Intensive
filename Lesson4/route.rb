
class Route

attr_reader :station

  def initialize(departure_station, destination_station)
    @stations = [departure_station, destination_station]
  end

  def get_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def all_route
    @stations.each {|stopping_point| puts stopping_point}
  end

  def stations
    @stations
  end
end

