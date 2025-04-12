class DndCharacter
  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma
  attr_reader :hitpoints

  BASE_HITPOINTS = 10

  def self.modifier(constitution)
    ((constitution - 10) / 2).truncate(0)
  end

  def initialize
    @prng = Random.new(Random.new_seed)
    @constitution = roll_4_dices_and_sum_top_3_values
    @strength = roll_4_dices_and_sum_top_3_values
    @dexterity = roll_4_dices_and_sum_top_3_values
    @wisdom = roll_4_dices_and_sum_top_3_values
    @intelligence = roll_4_dices_and_sum_top_3_values
    @charisma = roll_4_dices_and_sum_top_3_values
    @hitpoints = BASE_HITPOINTS + DndCharacter.modifier(constitution)
  end

  private 

  def roll_4_dices_and_sum_top_3_values
    rolls = [@prng.rand(1..6), @prng.rand(1..6), @prng.rand(1..6), @prng.rand(1..6)]
    rolls.max(3).sum
  end
end
