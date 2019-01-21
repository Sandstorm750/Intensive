
class Test
  # byebug

  def self.attr_accessor_with_history(attr)
    define_method("#{attr}=".to_sym) do |value| 
      instance_variable_set("@#{attr}".to_sym, value)    
    
      # 2 строчка метода
      instance_variable_set("@#{attr}_history".to_sym).send(:=, *args)
       
      # 3 строчка метода
      instance_variables("@#{attr}_history".to_sym) << value
    end

    # реализация метода number
    define_method("#{attr}".to_sym)
      instance_variable_get("@#{attr}".to_sym)
    end
    # реализация метода number history
    define_method("#{attr}_history".to_sym)
      instance_variable_get("@#{attr}_history".to_sym)
    end
  end

  # def self.strong_attr_accessor(attr, class_name)
  #   # тут реализация метода
  # end

  attr_accessor_with_history :number
 # strong_attr_accessor :name, String


  # def number=(value)
  #   @number = value
  #   @number_history ||= []
  #   @number_history << value
  # end
  
  # def number
  #   @number
  # end

  # def number_history
  #   @number_history
  # end

end


test = Test.new
test.number=(2)
test.number = 2


# attr = :number
# :number= "#{:number}=".to_sym
# :@number "#@{:number}".to_sym
puts test.number_history


# define_method(:my_method) do |foo, bar| # or even |*args|
#   # do something
# end


# instance_variable_get(:@number)
# instance_variable_set(:@number, 123)
# class_variable_get(:@validations)
# class_variable_set(:@validations, [])