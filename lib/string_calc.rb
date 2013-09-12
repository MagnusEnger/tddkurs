class StringCalculator
  attr_accessor :last_sum
  
  def initialize(logger)
    @logger = logger
  end
  def add(text)
    numbers = prepare_numbers(text)
    sum = calculate(numbers)
    @logger.write("got #{sum}")
    @last_sum = sum
    return sum
  end
  
  private
  
  def prepare_numbers(string)
    string.split(/,|\n/).map{ |n| n.to_i }
  end
  def calculate(numbers)
    numbers.inject(0) { |r, e| r += e }
  end
end
