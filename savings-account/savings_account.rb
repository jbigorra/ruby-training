module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0 then 3.213
    elsif balance < 1000 then 0.5
    elsif balance < 5000 then 1.621
    else 2.475
    end
  end

  def self.annual_balance_update(balance)
    balance * (1 + interest_rate(balance) / 100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years_until_desired_balance = 0
    balance = current_balance

    until balance >= desired_balance
      balance = self.annual_balance_update(balance)
      
      years_until_desired_balance += 1
    end
    
    years_until_desired_balance
  end
end
