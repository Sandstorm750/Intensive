require_relative 'station.rb'
require_relative 'counter.rb'

class Route

  include InstanceCounter

  attr_reader :station, :stations, :route_number

  def initialize(departure_station, destination_station)
    if departure_station.class == Station && destination_station.class == Station
      @stations = [departure_station, destination_station]
    end
    register_instance
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

