class CargoWagon < Wagon

  CARGO = :cargo

  def initialize(number, type = :cargo)
    super(number, type)
    @type = CARGO
  end
end