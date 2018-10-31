
class PassengerWagon < Wagon

  def initialize(number, release_year, type = 'passenger')
    super(number, release_year, type)
    @type = PASSENGER
  end

  PASSENGER = 'passenger'
end

