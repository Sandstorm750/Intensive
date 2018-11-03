
class CargoWagon < Wagon

  def initialize(number, type = 'cargo')
    super(number, type)
    @type = CARGO
  end

  CARGO = 'cargo'
end