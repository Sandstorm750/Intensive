require_relative 'train.rb'
require_relative 'counter.rb'

class Station

  include InstanceCounter

  attr_reader :name

  @@station_list = []

  def self.all
    @@station_list
  end

  def initialize(name)
    @name = name
    @train_list = []
    @@station_list << self
    register_instance
  end

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
    train_type = @train_list.select {|train| train.type == type}
    puts train_type
  end
end

