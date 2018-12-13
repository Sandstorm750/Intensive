require_relative 'train.rb'

class PassengerTrain < Train  

  def initialize(number, type = :passenger)
    super(number, type)
    @type = type    
  end
end

