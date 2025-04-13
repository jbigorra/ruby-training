class Matrix
  attr_reader :matrix

  def initialize(matrix_as_string)
    # ["1 2 3 4", "5 6 7 8"]
    # [
    #   [1,2,3,4], 
    #   [5,6,7,8]
    # ]
    @matrix = matrix_as_string
      .split("\n")
      .map { |row| row.split(" ").map { |n| n.to_i } }
  end

  def row(n) = matrix[n - 1]

  def column(n)
    matrix.map { |row| row[n - 1] }
  end
end
