
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'pass_train.rb'
require_relative 'wagon.rb'
require_relative 'cargo_wagon.rb'
require_relative 'pass_wagon.rb'
require_relative 'route.rb'


class Main

  attr_reader :trains, :station_list, :wagon_list, :routes
  attr_reader :stations

  def initialize
    @trains = []
    @station_list = []
    @wagon_list = []
    @routes = []
    @stations = []
  end

  def start

    loop do
      puts "Выберите объект для создания или действие, введя его номер из списка:

        1. Поезд
        2. Вагон
        3. Станция
        4. Маршрут
        5. Добавить станцию в Маршрут
        6. Удалить станцию из Маршрута
        7. Назначить Маршрут для Поезда
        8. Добавить Вагон к Поезду
        9. Отцепить Вагон от Поезда
        10. Переместить Поезд по Маршруту вперёд
        11. Переместить Поезд по Маршруту назад
        12. Просмотреть список Станций в Маршруте
        13. Просмотреть список Поездов на Станции
        14. Выход"

      input = gets.chomp.to_i

      case input
        when 1
          create_train
        when 2
          create_wagon
        when 3
          create_station
        when 4
          create_route
        when 5
          get_station
        when 6
          delete_station
        when 7
          assign_route
        when 8
          add_wagon
        when 9
          unpin_wagon
        when 10
          move_forward
        when 11
          return_back
        when 12
          all_route
        when 13
          train_list
        when 14
          exit
      end
    end
  end

  def create_train
    puts "Введите номер поезда:"
    number = gets.chomp.to_i

    puts "Выберите номер типа поезда:
    1. Грузовой
    2. Пассажирский"
    type = gets.chomp.to_i

    if type == 1
      train = CargoTrain.new(number, :cargo)
      @trains << train
    elsif type == 2
      train = PassengerTrain.new(number, :passenger)
      @trains << train
    else
      puts "Неверно указан тип поезда."
    end
  end

  def create_wagon
    puts "Введите номер вагона:"
    number = gets.chomp.to_i

    puts "Выберите номер типа вагона:
    1. Грузовой
    2. Пассажирский"
    type = gets.chomp.to_i

    if type == 1
      puts wagon = CargoWagon.new(number, :cargo)
    elsif type == 2
      puts wagon = PassengerWagon.new(number, :passenger)
    else
      puts "Неверно указан тип вагона."
    end
  end

  def create_station
      puts "Введите название станции:"
      name = gets.chomp.to_s

      if name == ""
        puts "Название станции не введено"
        return
      end

      station = Station.new(name)
      @station_list << station
      p @station_list
      puts station.name
  end

  def create_route
    
    puts "Выберите станцию отправления:"      
    st1 = gets.chomp.to_s
    @station_list.each do |station|
      if station.name == st1
        departure_station = station
      end      
    end    

    puts "Выберите станцию назначения:"      
    st2 = gets.chomp.to_s
    @station_list.each do |station|
      if station.name == st2
        destination_station = station
      end
    end    

    route = Route.new(departure_station, destination_station)
    puts @stations  
  end
  
  def get_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def assign_route
    
  end

  
end

main = Main.new
main.start