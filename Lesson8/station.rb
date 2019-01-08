require_relative 'train.rb'
require_relative 'counter.rb'

class Station
  include InstanceCounter

  attr_reader :name

  # rubocop:disable Style/ClassVars
  @@station_list = []

  def self.all
    @@station_list
  end

  NAME_FORMAT = /[a-zA-Z]{3,}/x

  def initialize(name)
    @name = name
    validate!
    @train_list = []
    @@station_list << self
    register_instance
  end
  # rubocop:enable Style/ClassVars

  def get_train(train)
    @train_list << train
  end

  def send_train(train)
    @train_list.delete(train)
  end

  def train_list
    @train_list.each do |train|
      puts train
    end
  end

  def type_list(type)
    train_type = @train_list.select { |train| train.type == type }
    puts train_type
  end

  def train_catcher
    @train_list.each { |train| yield(train) } if block_given?
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  protected

  def validate!
    raise "Name can't be nil." if name.nil?
    raise 'There are no such long station names.' if name.length > 25
    raise 'Enter the station name in letters only.' if name !~ NAME_FORMAT

    true
  end
end
