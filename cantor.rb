class Cantor
  attr_accessor :raw_integer
  attr_reader :cantor_expansion

  def initialize raw_integer
    self.raw_integer = raw_integer
    self.cantor_expansion = convert_to_cantor
  end

  def + other_cantor
  
  end

  def == other_cantor
    other_cantor.raw_integer == self.raw_integer
  end

  def to_s
    self.cantor_expansion.keys.reverse.each do |key, value|
      puts "Term"
      puts key
      puts value
    end
  end

  private
  def convert_to_cantor
    factorial_array = fill_factorial_array
    cantor_coefficient_hash = {}
    working_remainder = self.raw_integer

    factorial_array.each_with_index do |factorial, i|
      j = factorial_array.length - i
      cantor_coefficient_hash[j] = Math.floor(working_remainder/factorial) 
      working_remainder = working_remainder % factorial
    end

    cantor_coefficient_hash
  end

  def fill_factorial_array
    factorial_array = []
    factorial = 1
    i = 1

    while factorial >= self.raw_integer
      factorial *= i
      factorial_array << factorial
      i += 1
    end

    factorial_array.reverse!
  end

end