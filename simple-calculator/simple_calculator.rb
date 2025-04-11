class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze


  def self.calculate(first_operand, second_operand, operation)
    if not ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation.new("Invalid operation")
    end

    if not first_operand.is_a?(Numeric) or not second_operand.is_a?(Numeric)
      raise ArgumentError.new
    end

    begin      
      
      result = nil
      case operation
      when "+"
        result = first_operand + second_operand
      when "*"
        result = first_operand * second_operand
      when "/"
        result = first_operand / second_operand
      end

      "#{first_operand.to_s} #{operation} #{second_operand.to_s} = #{result}"
    rescue ZeroDivisionError => _
      "Division by zero is not allowed."
    end
  end

  class UnsupportedOperation < StandardError
  end
end
