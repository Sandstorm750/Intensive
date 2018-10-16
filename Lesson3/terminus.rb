
class Train

  attr_accessor :speed
  attr_reader :wagons_number, :type, :number

  def initialize(number, type, wagons_number)
    @number = number
    @type = type
    @wagons_number = wagons_number.to_i
    @speed = 0
  end

  def stop
    @speed = 0
  end

  def speedup
    while @speed < 80
    @speed += 1
    end
  end

  def deceleration
    while @speed >= 0
    @speed -= 1
    end
  end

  def current_speed
    puts @speed
  end

  def add_wagon
    if speed == 0
    @wagons_number += 1
    else puts "Это невозможно сделать в движении!"
    end
  end

  def unpin_wagon
    if speed == 0
    @wagons_number -= 1
    else puts "Это невозможно сделать в движении!"
    end
  end

  def show_wagon
    puts @wagons_number
  end

  def get_route(route)
    @my_route = route
    @current_station = route.stations[0]
    @current_station.get_train(self)
  end

  def current_station
    puts @current_station.station
  end

  def next_station
    @current_station = @my_route.stations[@my_route.stations.index(@current_station) + 1]
    puts @current_station.station
  end
  def previous_station
    @current_station = @my_route.stations[@my_route.stations.index(@current_station) - 1]
    puts @current_station.station
  end  
end

class Station

  attr_reader :station

  def initialize(station)
    @station = station
    @train_list = []
  end

  def get_train(train)
    @train_list << train
  end

  def send_train(train)
    @train_list.delete(train)
  end

  def train_list
    @train_list.each do |train|
      puts train
    end
  end
  
  def type_list(type)
    @train_list.each do |train|
      if train.type == type
        puts train
      end
    end
  end
end

class Route

attr_reader :station

  def initialize(departure_station, destination_station)
    @departure_station = departure_station
    @destination_station = destination_station
    @stations = []
  end

  def get_station(station)
    @stations << station
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def all_route
    @stations.unshift @departure_station
    @stations << @destination_station
    @stations.each {|stopping_point| puts stopping_point.station}
  end

  def stations
    @stations
  end
end

