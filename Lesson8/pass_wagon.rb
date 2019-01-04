require_relative 'wagon.rb'

class PassengerWagon < Wagon
  WAGON_TYPE = :passenger

  attr_accessor :number_seats, :seat, :occupied_seats

  def initialize(number, type, number_seats)
    super(number, type)
    @type = WAGON_TYPE
    @number_seats = number_seats
    @occupied_seats = 0
  end

  def add_seat
    @occupied_seats += 1 if @occupied_seats < @number_seats && @occupied_seats >= 0
  end

  def free_seats
    @number_seats - @occupied_seats
  end
end
