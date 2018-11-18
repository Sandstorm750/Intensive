
require_relative 'manufacturer.rb'

class Wagon
  
  include Manufacturer

  attr_accessor :number, :type

  def initialize(number, type)
    @number = number.to_i
    @type = type
  end
end

