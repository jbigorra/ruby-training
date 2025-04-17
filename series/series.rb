class Series
  attr_reader :digits

  def initialize(digits)
    raise ArgumentError.new if digits.empty?
    
    @digits = digits.chars
  end

  def slices(n)
    raise ArgumentError.new if n > digits.size
    raise ArgumentError.new if n <= 0

    digits.each_cons(n).map(&:join)
  end
end
