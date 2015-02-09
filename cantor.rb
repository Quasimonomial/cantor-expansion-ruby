class Cantor
  attr_accessor :raw_integer
  attr_reader :cantor_expansion

  def initialize raw_integer
    @raw_integer = raw_integer
    @cantor_expansion_coefficients = convert_to_cantor
  end

  def + other_cantor #note this is a function that simulates how you would add cantor expansions on paper, the efficent way would be the add the raw integers and return the result, this is more interesting
    #this function also retunrs a cantor hash instead of a new object, as I don't have a hash to raw integer converter... something I'll fix if I come back to this project.  shouldn't be too bad, as this is mostly for fun anyway
    # sum_cantor_coefficients = Hash.new 
    
    #I need a better way to do defaults for hashes, so I guess I'll come back to this and tweak it later
  end

  def == other_cantor
    @raw_integer = other_cantor.raw_integer
  end

  def to_s
    cantor_strings = []
    @cantor_expansion_coefficients.keys.sort.reverse.each do |key|
      value = @cantor_expansion_coefficients[key];
      next if value == 0
      cantor_strings << value.to_s + "*" + key.to_s + "!" 
    end

    cantor_strings.join(" + ")
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