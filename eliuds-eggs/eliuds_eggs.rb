module EliudsEggs
  def self.egg_count(n)
    quotient = n
    remainder = nil
    laid_eggs = 0
    
    while quotient > 0
      quotient, remainder = quotient.divmod(2)
      laid_eggs += 1 if remainder == 1  
    end
    
    laid_eggs
  end
end
