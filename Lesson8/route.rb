require_relative 'station.rb'
require_relative 'counter.rb'

class Route
  include InstanceCounter

  attr_reader :station, :stations

  def initialize(departure_station, destination_station)
    @stations = [departure_station, destination_station]
    validate!
    register_instance
  end

  def get_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def all_route
    @stations.each { |stopping_point| puts stopping_point }
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  def validate!
    raise 'Вы выбрали не станцию' unless @stations.all? { |st| st.is_a?(Station) }

    true
  end
end
