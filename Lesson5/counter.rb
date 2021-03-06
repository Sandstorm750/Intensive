module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods

    def instances
      @instances ||= 0
    end

    def increase_instances
      @instances = instances + 1
    end
  end

  module InstanceMethods

    private
    def register_instance
      self.class.increase_instances
    end
  end
end

