
require_relative 'station.rb'

class Route

attr_reader :station

  def initialize(departure_station, destination_station)
    if departure_station.class == Station && destination_station.class == Station
      @stations = [departure_station, destination_station]
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

