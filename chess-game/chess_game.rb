module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    RANKS.include?(rank.to_i) and FILES.include?(file)
  end

  def self.nick_name(first_name, last_name)
    "#{first_name[..1]}#{last_name[-2..]}".upcase
  end

  def self.move_message(first_name, last_name, square)
    file = square[0]
    rank = square[1]
    nickname = nick_name(first_name, last_name)
    
    return "#{nickname} moved to #{square}" if valid_square?(rank, file) 
    return "#{nickname} attempted to move to #{square}, but that is not a valid square" 
  end
end
