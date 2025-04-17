module EliudsEggs
  def self.egg_count(n)
    n.to_s(2).count('1')
  end
end
