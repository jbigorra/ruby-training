class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    phrase.tally
  end
end