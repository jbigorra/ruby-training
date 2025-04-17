class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    phrase.each_with_object({}) do |value, obj|
      obj[value] ||= 0
      obj[value] += 1
      obj
    end
  end
end