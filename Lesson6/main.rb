require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'pass_train.rb'
require_relative 'wagon.rb'
require_relative 'cargo_wagon.rb'
require_relative 'pass_wagon.rb'
require_relative 'route.rb'
require 'byebug'

class Main

  attr_reader :trains, :station_list, :wagon_list, :routes
  attr_reader :route, :route_number

  def initialize
    @trains = []
    @station_list = []
    @wagon_list = []
    @routes = []    
  end

  def start

    loop do
      puts "Выберите действие, введя его номер из списка:

        1. Создать Поезд
        2. Создать Вагон
        3. Создать Станцию
        4. Создать Маршрут
        5. Добавить Станцию в Маршрут
        6. Удалить Станцию из Маршрута
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
          add_station
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
          all_stations
        when 13
          train_list
        when 14
          exit
      end
    end
  end

  # 1 - Создаём поезд
  def create_train
    #byebug

    begin
      puts "Введите номер поезда:"
      number = gets.chomp.to_s

      if @trains.find {|train| train.number == number}
        return puts "Поезд с таким номером уже был создан ранее"
      end

      puts "Выберите номер типа поезда:
      1. Грузовой
      2. Пассажирский"
      type = gets.chomp.to_i

      if type == 1
        @trains << CargoTrain.new(number, :cargo)
      elsif type == 2
        @trains << PassengerTrain.new(number, :passenger)
      else 
        return puts "Неверно указан тип поезда."
      end
    
    rescue RuntimeError => e
      puts "#{e.message} Try again."
      retry
    end
  end

  # 2 - Создаём вагон
  def create_wagon
    begin
      puts "Введите номер вагона:"
      number = gets.chomp.to_s

      if @wagon_list.find {|wagon| wagon.number == number}
        return puts "Вагон с таким номером уже был создан ранее"
      end

      puts "Выберите номер типа вагона:
      1. Грузовой
      2. Пассажирский"
      type = gets.chomp.to_i

      if type == 1
        @wagon_list << CargoWagon.new(number, :cargo)
      elsif type == 2
        @wagon_list << PassengerWagon.new(number, :passenger)
      else return puts "Неверно указан тип вагона."
      end

    rescue RuntimeError => e
      puts "#{e.message} Попробуйте снова."
      retry
    end

    p @wagon_list
  end

  # 3 - Создаём станцию
  def create_station
    begin
      puts "Введите название станции:"
      name = gets.chomp.to_s

      if @station_list.find {|station| station.name == name}
        return puts "Станция с таким названием уже существует"
      else
        @station_list << Station.new(name)
      end

    rescue RuntimeError => e
      puts "#{e.message} Try again."
      retry
    end
    
    p @station_list
  end

  # 4 - Создаём маршрут
  def create_route

    puts "Выберите Станцию отправления и Станцию назначения из списка:"

    @station_list.each_with_index do |station, index|
      puts "   #{index + 1}:   #{station.name}"
    end

    puts "Станция Отправления:"
    st1 = gets.chomp.to_i

    if st1 > @station_list.length || st1 <= 0
      return puts "Неверно выбран номер Станции"
    else
      departure_station = @station_list[st1 - 1]
      puts departure_station #@station_list[st1 - 1]
    end

    puts "Станция Назначения:"
    st2 = gets.chomp.to_i

    if st2 > @station_list.length || st2 <= 0
      return puts "Неверно выбран номер Станции"
    else
      destination_station = @station_list[st2 - 1]
      puts destination_station      
    end

    if destination_station == departure_station
      return puts "Эта Станция уже была выбрана как Станция Отправления"
    end
    
    @routes << Route.new(departure_station, destination_station)
    puts @routes
  end
  
  # 5 - Добавляем станцию в маршрут
  def add_station

    puts "Выберите номер Маршрута из списка:"

    @routes.each_with_index do |route, index|
      puts "  #{index + 1}:  #{route.stations.first.name} - #{route.stations.last.name}"
    end

    r_num = gets.chomp.to_i
    if r_num > @routes.length || r_num <= 0
      return puts "Неверно выбран номер Маршрута"
    else
      route = @routes[r_num - 1]
      p route
    end

    puts "Выберите Станцию из списка для добавления в Маршрут:"

    @station_list.each_with_index do |station, index|
      puts "   #{index + 1}:  #{station.name}"
    end

    st = gets.chomp.to_i
    if route.stations.find{|station| station == @station_list[st - 1]}
      return puts "Такая станция уже есть в Маршруте #{r_num}"
    elsif
      station = @station_list[st - 1]
      route.stations.insert(-2, station)
    else
      return puts "Неверно выбрано название станции"
    end    
    
    p route.stations
  end

  # 6 - Удаляем станцию из маршрута
  def delete_station

    puts "Выберите номер Маршрута из списка:"

    @routes.each_with_index do |route, index|
      puts "  #{index + 1}:  #{route.stations.first.name} - #{route.stations.last.name}"
    end

    r_num = gets.chomp.to_i
    if r_num > @routes.length || r_num <= 0
      return puts "Неверно выбран номер Маршрута"
    else
      route = @routes[r_num - 1]
      p route
    end

    puts "Выберите Станцию из списка для удаления из Маршрута #{r_num}:"

    route.stations.each_with_index do |station, index|
      puts "   #{index + 1}:  #{station.name}"
    end

    st = gets.chomp.to_i
    if st > route.stations.length || st <= 0
      return puts "Такой Станции нет в Маршруте #{r_num}"
    else
      station = route.stations[st - 1]
      route.stations.delete(station)
    end    
    
    p route.stations
  end

  # 7 - Назначаем маршрут поезду
  def assign_route

    puts "Выберите Поезд по номеру списка для назначения Маршрута:"

    @trains.each_with_index do |train, index|
      puts "   #{index + 1}:   #{train.number} тип #{train.type}"
    end  
    
    num = gets.chomp.to_i

    if num > @trains.length || num <= 0
      return puts "Неверно выбран номер Поезда"
    else
      train = @trains[num - 1]
    end

    puts "Выберите номер Маршрута из списка:"

    @routes.each_with_index do |route, index|
      puts "  #{index + 1}:  #{route.stations.first.name} - #{route.stations.last.name}"
    end

    r_num = gets.chomp.to_i
    if r_num > @routes.length || r_num <= 0
      return puts "Неверно выбран номер Маршрута"
    else
      route = @routes[r_num - 1]
      train.get_route(route)
    end

    p train

  end

  # 8 - Добавляем вагон к поезду
  def add_wagon

    puts "Выберите Поезд по номеру к которому надо добавить Вагон::"

    @trains.each_with_index do |train, index|
      puts "   #{index + 1}:   #{train.number} тип #{train.type}"
    end  
    
    num = gets.chomp.to_i

    if num > @trains.length || num <= 0
      return puts "Неверно выбран номер Поезда"
    else
      train = @trains[num - 1]
    end

    puts "Выберите номер Вагона из списка для добавления к Поезду № #{num}:"

    @wagon_list.each_with_index do |wagon, index|
      puts "   #{index + 1}:   #{wagon.number} тип #{wagon.type}"
    end

    wag = gets.chomp.to_i

    if wag > @wagon_list.length || wag <= 0
      return puts "Неверно выбран номер Вагона"
    else
      wagon = @wagon_list[wag - 1]
    end

    if train.type != wagon.type
      return puts "Этот Вагон не может быть прицеплен к этому Поезду"
    else train.wagons << wagon
    end   

    p train
  end

  # 9 - Отцепляем вагон от поезда
  def unpin_wagon

    puts "Выберите Поезд по номеру от которого надо отцепить Вагон:"

    @trains.each_with_index do |train, index|
      puts "   #{index + 1}:   #{train.number} тип #{train.type}"
    end  
    
    num = gets.chomp.to_i

    if num > @trains.length || num <= 0
      return puts "Неверно выбран номер Поезда"
    else
      train = @trains[num - 1]
    end

    puts "Выберите номер Вагона из списка для отцепления от Поезда № #{num}:"

    train.wagons.each_with_index do |wagon, index|
      puts "   #{index + 1}:   #{wagon.number} тип #{wagon.type}"
    end

    wag = gets.chomp.to_i

    if wag > train.wagons.length || wag <= 0
      return puts "Неверно выбран номер Вагона"
    else
      wagon = train.wagons[wag - 1]
      train.wagons.delete(wagon)
    end    

    p train
  end

  # 10 - Двигаем поезд вперёд на 1 станцию
  def move_forward
    puts "Выберите Поезд для продвижения вперёд:"

    @trains.each_with_index do |train, index|
      puts "   #{index + 1}:   #{train.number} тип #{train.type}"
    end  
    
    num = gets.chomp.to_i

    if num > @trains.length || num <= 0
      return puts "Неверно выбран номер Поезда"
    else
      train = @trains[num - 1]
      train.move_forward
    end

    p train
  end

  # 11 - Двигаем поезд назад на 1 станцию
  def return_back
    puts "Выберите Поезд для возвращения назад:"

    @trains.each_with_index do |train, index|
      puts "   #{index + 1}:   #{train.number} тип #{train.type}"
    end  
    
    num = gets.chomp.to_i

    if num > @trains.length || num <= 0
      return puts "Неверно выбран номер Поезда"
    else
      train = @trains[num - 1]
      train.return_back
    end

    p train
  end

  # 12 - Список станций в Маршруте
  def all_stations

    puts "Выберите номер Маршрута из списка:"

    @routes.each_with_index do |route, index|
      puts "  #{index + 1}:  #{route.stations.first.name} - #{route.stations.last.name}"
    end

    r_num = gets.chomp.to_i
    if r_num > @routes.length || r_num <= 0
      return puts "Неверно выбран номер Маршрута"
    else
      route = @routes[r_num - 1]
      puts route.stations
    end
  end

  # 13 - Список поездов на Станции
  def train_list

    puts "Выберите Станцию из списка для просмотра поездов на ней:"

    @station_list.each_with_index do |station, index|
      puts "   #{index + 1}:   #{station.name}"
    end

    st = gets.chomp.to_i

    if st > @station_list.length || st <= 0
      return puts "Неверно выбран номер Станции"
    else
      station = @station_list[st - 1]
      station.train_list
    end    
  end
end

main = Main.new
main.start

