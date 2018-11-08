
require_relative 'station.rb'

class Route

attr_reader :station, :stations, :route_number

  def initialize(route_number, departure_station, destination_station)
    if departure_station.class == Station && destination_station.class == Station
      @stations = [departure_station, destination_station]
      @route_number = route_number
    end
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

