class Cantor
  attr_accessor :raw_integer

  def initialize raw_integer
    self.raw_integer = raw_integer

  end

  def print

  end

  def == other_cantor
    other_cantor.raw_integer == self.raw_integer
  end

  private
  def convert_to_cantor
  end


end