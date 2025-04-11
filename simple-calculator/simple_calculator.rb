class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze


  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation.new("Invalid operation") unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError.new unless first_operand.is_a?(Numeric) 
    raise ArgumentError.new unless second_operand.is_a?(Numeric) 

    begin      
      result = first_operand.send(operation, second_operand)

      "#{first_operand.to_s} #{operation} #{second_operand.to_s} = #{result}"
    rescue ZeroDivisionError => _
      "Division by zero is not allowed."
    end
  end

  class UnsupportedOperation < StandardError
  end
end
