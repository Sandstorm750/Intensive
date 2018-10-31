
class CargoWagon < Wagon

  def initialize(number, release_year, type = 'cargo')
    super(number, release_year, type)
    @type = CARGO
  end

  CARGO = 'cargo'
end