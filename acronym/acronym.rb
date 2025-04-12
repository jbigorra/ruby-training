module Acronym
  def self.abbreviate(string)
    string.scan(/\w+/,).map { |word| word[0].upcase }.join
  end
end
