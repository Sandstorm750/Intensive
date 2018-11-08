
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
  attr_reader :route, :route_number

  def initialize
    @trains = []
    @station_list = []
    @wagon_list = []
    @routes = []
    #@stations = []
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
    puts "Введите номер поезда:"
    number = gets.chomp.to_i

    if @trains.find {|train| train.number == number}
      return puts "Поезд с таким номером уже был создан ранее"
    end

    puts "Выберите номер типа поезда:
    1. Грузовой
    2. Пассажирский"
    type = gets.chomp.to_i

    if type == 1
      train = CargoTrain.new(number, :cargo)
    elsif type == 2
      train = PassengerTrain.new(number, :passenger)
    else return puts "Неверно указан тип поезда."
    end

    @trains << train
    p @trains
  end

  # 2 - Создаём вагон
  def create_wagon
    puts "Введите номер вагона:"
    number = gets.chomp.to_i

    if @wagon_list.find {|wagon| wagon.number == number}
      return puts "Вагон с таким номером уже был создан ранее"
    end

    puts "Выберите номер типа вагона:
    1. Грузовой
    2. Пассажирский"
    type = gets.chomp.to_i

    if type == 1
      wagon = CargoWagon.new(number, :cargo)
    elsif type == 2
      wagon = PassengerWagon.new(number, :passenger)
    else return puts "Неверно указан тип вагона."
    end

    @wagon_list << wagon
    p @wagon_list
  end

  # 3 - Создаём станцию
  def create_station
    puts "Введите название станции:"
    name = gets.chomp.to_s

    if @station_list.find {|station| station.name == name}
    return puts "Станция с таким названием уже существует"
    elsif name == ""
      return puts "Название станции не введено"
    else station = Station.new(name)
      @station_list << station
    end    
    
    puts @station_list
  end

  # 4 - Создаём маршрут
  def create_route

    puts "Задайте номер маршрута:"      
    route_number = gets.chomp.to_i

    if @routes.find {|route| route.route_number == route_number}
      return puts "Маршрут с таким номером уже существует"
    end

    puts "Выберите станцию отправления:"      
    st1 = gets.chomp.to_s
    if departure_station = @station_list.find{|station| station.name == st1}
    else return puts "Неверно выбрано название станции"
    end
    
    puts "Выберите станцию назначения:"      
    st2 = gets.chomp.to_s
    if destination_station = @station_list.find{|station| station.name == st2}
    else return puts "Неверно выбрано название станции"
    end

    if destination_station == departure_station
      return puts "Эта Станция уже выбрана как Станция Отправления"
    end
    
    @route = Route.new(route_number, departure_station, destination_station)
    @routes << @route
    
    p @routes
  end
  
  # 5 - Добавляем станцию в маршрут
  def add_station

    puts "Укажите номер Маршрута:"
    r_num = gets.chomp.to_i
    if route = @routes.find{|route| route.route_number == r_num}
    else return puts "Неверно выбран номер Маршрута"
    end

    puts "Выберите станцию для добавления в Маршрут:"      
    st = gets.chomp.to_s
    if route.stations.find{|station| station.name == st}
      return puts "Такая станция уже есть в Маршруте #{r_num}"
    elsif station = @station_list.find{|station| station.name == st}      
    else return puts "Неверно выбрано название станции"
    end

    route.stations.insert(-2, station)
    
    p route.stations
  end

  # 6 - Удаляем станцию из маршрута
  def delete_station

    puts "Укажите номер Маршрута:"
    r_num = gets.chomp.to_i
    if route = @routes.find{|route| route.route_number == r_num}
      puts "Выберите станцию для удаления из Маршрута:"
    else return puts "Неверно выбран номер Маршрута"
    end
          
    st = gets.chomp.to_s
    if station = route.stations.find{|station| station.name == st}
      route.stations.delete(station)
    else station = route.stations.find{|station| station.name != st}
      return puts "Такой станции нет в Маршруте #{r_num}"
    end
    
    p route.stations
  end

  # 7 - Назначаем маршрут поезду
  def assign_route
    puts "Выберите номер Поезда для назначения Маршрута:"
    num = gets.chomp.to_i

    if train = @trains.find{|train| train.number == num}
      puts "Чтобы выбрать Маршрут для Поезда № #{num} выберите Станцию отправления и Станцию назначения.
    Станция отправления:"
    else return puts "Неверно выбран номер поезда"
    end

    st1 = gets.chomp.to_s
    puts "    Станция назначения:"
    st2 = gets.chomp.to_s

    if st1 == @route.stations.first.name && st2 == @route.stations.last.name
      train.get_route(@route)
    else return puts "Такого маршрута нет"
    end
    p train
  end

  # 8 - Добавляем вагон к поезду
  def add_wagon
    puts "Выберите номер Поезда к которому надо добавить Вагон:"
    num = gets.chomp.to_i

    if train = @trains.find{|train| train.number == num}
      puts "Укажите номер Вагона для добавления к Поезду № #{num}:"
    else return puts "Такого поезда нет в списке"
    end

    wag = gets.chomp.to_i
    if wagon = @wagon_list.find{|wagon| wagon.number == wag}
    else return puts "Такого Вагона нет в списке"
    end

    if train.type != wagon.type
      return puts "Этот Вагон не может быть прицеплен к этому Поезду"
    else train.wagons << wagon
    end   

    p train
  end

  # 9 - Отцепляем вагон от поезда
  def unpin_wagon
    puts "Выберите номер Поезда от которого надо отцепить Вагон:"
    num = gets.chomp.to_i

    if train = @trains.find{|train| train.number == num}
      puts "Укажите номер Вагона для отцепления от Поезда № #{num}:"
    else return puts "Такого поезда нет в списке"
    end

    wag = gets.chomp.to_i
    if wagon = train.wagons.find{|wagon| wagon.number == wag}
      train.wagons.delete wagon
    else return puts "Такого Вагона нет в списке"
    end

    p train
  end

  # 10 - Двигаем поезд вперёд на 1 станцию
  def move_forward
    puts "Выберите номер Поезда который надо отправить вперёд по Маршруту:"
    num = gets.chomp.to_i

    if train = @trains.find{|train| train.number == num}
      train.move_forward
    else return puts "Такого поезда нет в списке"
    end

    p train
  end

  # 11 - Двигаем поезд назад на 1 станцию
  def return_back
    puts "Выберите номер Поезда который надо отправить назад по Маршруту:"
    num = gets.chomp.to_i

    if train = @trains.find{|train| train.number == num}
      train.return_back
    else return puts "Такого поезда нет в списке"
    end

    p train
  end

  # 12 - Список станций в Маршруте
  def all_stations
    puts "Укажите номер Маршрута:"
    r_num = gets.chomp.to_i
    if route = @routes.find{|route| route.route_number == r_num}
      puts route.stations
    else return puts "Неверно выбран номер Маршрута"
    end
  end

  # 13 - Список поездов на Станции
  def train_list
    puts "Выберите Станцию для демонстрации Списка Поездов:"      
    st = gets.chomp.to_s
    if station = @station_list.find{|station| station.name == st}
      station.train_list
    else return puts "Неверно выбрано название станции"
    end
  end
end

main = Main.new
main.start