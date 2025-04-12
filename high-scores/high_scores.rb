class HighScores
  def initialize(game_score)
    @game_score = game_score
  end

  def scores
    @game_score
  end

  def latest
    @game_score[-1]
  end

  def personal_best(scores = nil)
    scores_list = scores.nil? ? @game_score : scores

    scores_list.inject(0) do | prev, score |
      score > prev ? score : prev
    end 
  end

  def personal_top_three
    sorted_scores = @game_score.sort { |a, b| b <=> a }
    
    sorted_scores.take(3).take_while { |score| not score.nil? }
  end  

  def latest_is_personal_best?
    latest == personal_best
  end
end