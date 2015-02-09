class Cantor
  attr_accessor :raw_integer
  attr_reader :cantor_expansion

  def initialize raw_integer
    @raw_integer = raw_integer
    @cantor_expansion = convert_to_cantor
  end

  # def + other_cantor
  
  # end

  def == other_cantor
    other_cantor.raw_integer == @raw_integer
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
    p "Here!"
    factorial_array = fill_factorial_array
    p factorial_array
    cantor_coefficient_hash = {}
    working_remainder = @raw_integer

    factorial_array.each_with_index do |factorial, i|
      j = factorial_array.length - i
      quotient = (working_remainder/factorial).floor 
      working_remainder = working_remainder % factorial
      next if i == 0 && quotient == 0 # kind of odd, but we have to account for if our cantor expansion is for a factorial number itself, but if its not we don't want to include a 0 value in front of most numbers
      cantor_coefficient_hash[j] = quotient
    end

    cantor_coefficient_hash
  end

  def fill_factorial_array
    p "Now here!"
    factorial_array = []
    factorial = 1
    i = 1

    while factorial <= @raw_integer
      factorial *= i
      factorial_array << factorial
      i += 1
    end

    factorial_array.reverse!
  end

end