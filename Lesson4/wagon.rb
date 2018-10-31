
class Wagon

  attr_accessor :number, :release_year, :type

  def initialize(number, release_year, type)
    @number = number.to_i
    @release_year = release_year.to_i
    @type = type
  end
end


