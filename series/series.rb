class Series
  attr_reader :digits

  def initialize(digits)
    raise ArgumentError.new if digits.empty?
    @digits = digits.chars
  end

  def slices(n)
    raise ArgumentError.new if n > digits.size
    raise ArgumentError.new if n <= 0

    result = []
    iterations = digits.length
    
    iterations.times do |i|
      result.push(digits[i...(i + n)].join)

      break if (i + 1 - (iterations - n) > 0)
    end
    
    result
  end
end
