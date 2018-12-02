require_relative 'manufacturer.rb'

class Wagon
  
  include Manufacturer

  attr_accessor :number, :type

  WAGON_NUMBER_FORMAT = /^\d{2}$/

  def initialize(number, type)
    @number = number
    @type = type
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Number can't be nil." if number.nil?
    raise "Enter the number in the format '00'." if number.length != 2
    raise "Number has invalid format." if number !~ WAGON_NUMBER_FORMAT
    true
  end
end

