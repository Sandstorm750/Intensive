require_relative 'wagon.rb'

class CargoWagon < Wagon
  WAGON_TYPE = :cargo

  attr_accessor :volume, :occupied_volume

  def initialize(number, type, volume)
    super(number, type)
    @type = WAGON_TYPE
    @volume = volume
    @occupied_volume = 0
  end

  def add_volume(new_volume)
    if new_volume <= free_volume && new_volume > 0
      @occupied_volume += new_volume
    else
      puts 'Недостаточно свободного места для погрузки.'
    end
  end

  def free_volume
    @volume - @occupied_volume
  end
end
