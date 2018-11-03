
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'pass_train.rb'
require_relative 'wagon.rb'
require_relative 'cargo_wagon.rb'
require_relative 'pass_wagon.rb'
require_relative 'route.rb'


class Main
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


def create_station
    puts "Введите название станции:"
    name = gets.chomp.to_s

    station = Station.new(name)
    puts station    
  end

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
      get_route
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

  def create_train
    puts "Введите номер поезда:"
    number = gets.chomp.to_i

    puts "Выберите номер типа поезда:
    1. Грузовой
    2. Пассажирский"
    type = gets.chomp.to_i

    if type == 1
      puts train = CargoTrain.new(number, :cargo)
    elsif type == 2
      puts train = PassengerTrain.new(number, :passenger)
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

  
end

main = Main.new
main.start