class DndCharacter
  ATTR = %i[strength dexterity constitution intelligence wisdom charisma hitpoints].freeze
  BASE_HITPOINTS = 10
  DICE = (1..6)

  attr_reader(*ATTR)

  def self.modifier(constitution)
    ((constitution - 10) / 2).floor
  end

  def initialize
    @prng = Random.new(Random.new_seed)
    @constitution = roll_4_dices_and_sum_top_3_values
    @strength = roll_4_dices_and_sum_top_3_values
    @dexterity = roll_4_dices_and_sum_top_3_values
    @wisdom = roll_4_dices_and_sum_top_3_values
    @intelligence = roll_4_dices_and_sum_top_3_values
    @charisma = roll_4_dices_and_sum_top_3_values
    @hitpoints = BASE_HITPOINTS + self.class.modifier(constitution)
  end

  private 

  def roll_4_dices_and_sum_top_3_values
    rolls = [@prng.rand(DICE), @prng.rand(DICE), @prng.rand(DICE), @prng.rand(DICE)]
    rolls.max(3).sum
  end
end
