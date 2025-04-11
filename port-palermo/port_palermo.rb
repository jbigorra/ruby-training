module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[0,4].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    return :B unless ship_identifier[0,3].match?(/(OIL|GAS)/)
    :A
  end
end
