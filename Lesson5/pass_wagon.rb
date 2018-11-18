
class PassengerWagon < Wagon

  def initialize(number, type = :passenger)
    super(number, type)
    @type = PASSENGER
  end

  PASSENGER = :passenger
end

