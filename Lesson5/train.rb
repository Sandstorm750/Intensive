require_relative 'manufacturer.rb'
require_relative 'counter.rb'

class Train

  include Manufacturer
  include InstanceCounter

  @@train_hesh = {}

  def self.find(number)

    @@train_hesh[number]
    
  end

  attr_accessor :speed
  attr_reader :number, :type, :wagons

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    @@train_hesh[number] = self
    register_instance
  end

  #instances

  def stop
    @speed = 0
  end

  def speedup(speedup)
    @speed += speedup
  end

  def deceleration(deceleration)
    @speed -= deceleration
  end

  def current_speed
    puts @speed
  end

  def add_wagon(wagon)
    if speed == 0
      @wagons << wagon
    else
      puts "Это невозможно сделать в движении!"
    end
  end

  def unpin_wagon(wagon)
    if speed == 0
      @wagons.delete(wagon)
    else
      puts "Это невозможно сделать в движении!"
    end
  end

  def show_wagons
    puts @wagons
  end

  def get_route(route)
    @my_route = route
    @station_index = 0
    current_station.get_train(self)
  end

  def current_station
    @my_route.stations[@station_index]
  end

  def next_station
    @next_station = @my_route.stations[@station_index + 1]
  end

  def previous_station
    if @station_index == 0
      @previous_station = nil
    else
      @previous_station = @my_route.stations[@station_index - 1]
    end
  end

  def move_forward
    return if current_station == @my_route.stations.last
    current_station.send_train(self)
    @station_index += 1    
    current_station.get_train(self)
  end

  def return_back
    if previous_station
      current_station.send_train(self)
      @station_index -= 1
      current_station.get_train(self)
    end
  end  
end

