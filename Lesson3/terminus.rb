
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

  def speedup(speedup) # =item.to_i
    @speed += speedup
  end

  def deceleration(deceleration) # =item.to_i
    @speed -= deceleration
  end

  def current_speed
    puts @speed
  end

  def add_wagon
    if speed == 0
      @wagons_number += 1
    else
      puts "Это невозможно сделать в движении!"
    end
  end

  def unpin_wagon
    if speed == 0
      @wagons_number -= 1
    else
      puts "Это невозможно сделать в движении!"
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
    @current_station
  end
  def show_current_station
    @current_station.name
  end

  def station_index
    @station_index = @my_route.stations.index(@current_station)
    puts @station_index
  end

  def next_station
    @next_station = @my_route.stations[@my_route.stations.index(@current_station) + 1]
    @next_station.name
  end
  def previous_station
    @previous_station = @my_route.stations[@my_route.stations.index(@current_station) - 1]
    @previous_station.name
  end

  def move_forward
    self.next_station
    @current_station = @next_station
    puts "Движемся на следующую станцию #{@next_station.name}."
  end

  def return_back
    self.previous_station
    @current_station = @previous_station
    puts "Возвращаемся на предыдущую станцию #{@previous_station.name}."
  end

  def show_stations
    puts "Предыдущая станция: #{self.previous_station}."
    puts "Текущая станция: #{self.show_current_station}."
    puts "Следующая станция: #{self.next_station}."
  end
end

class Station

  attr_reader :name

  def initialize(name)
    @name = name
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
    train_type = @train_list.select {|train| train.type == type}
    puts train_type
  end
end

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
    @stations.each {|stopping_point| puts stopping_point.name}
  end

  def stations
    @stations
  end
end

