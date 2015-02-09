class Cantor
  attr_accessor :raw_integer
  attr_reader :cantor_expansion

  def initialize raw_integer
    self.raw_integer = raw_integer
    self.cantor_expansion = self.convert_to_cantor
  end

  def + other_cantor
  
  end

  def == other_cantor
    other_cantor.raw_integer == self.raw_integer
  end

  def to_s
    
  end

  private
  def convert_to_cantor
    
  end


end