module EliudsEggs
  def self.egg_count(n)
    quotient = n
    remainder = nil
    laid_eggs = 0
    
    while quotient > 0
      remainder = quotient % 2
      quotient = (quotient / 2).floor
      
      laid_eggs += 1 if remainder == 1  
    end
    
    laid_eggs
  end
end
