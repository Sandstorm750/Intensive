class PassengerWagon < Wagon

  PASSENGER = :passenger

  def initialize(number, type = :passenger)
    super(number, type)
    @type = PASSENGER
  end
end

