=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

module Tournament

  module_function
  
  def tally(input)
    matches = input.split("\n").map {|m| m.split(";")}
    
    # 31 spaces before table starts
    tally = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
    TALLY

    matches_results = []

    matches.each do |match|

      team_one = match[0]
      team_two = match[1]
      result = match[2]
      
      self.allocate_match_results(local: team_one, visitor: team_two, match_result: result, matches_results:)
    end

    # Sort by points (index 5) in descending order, then by team name (index 0) in ascending order
    matches_results.sort_by! { |result| [-result[5], result[0]] }

    matches_results.each do |m|
      tally += <<~TALLY
        #{self.adjust_team_lead_spaces(m[0])}|#{self.adjust_score_spaces(m[1])}|#{self.adjust_score_spaces(m[2])}|#{self.adjust_score_spaces(m[3])}|#{self.adjust_score_spaces(m[4])}|#{self.adjust_score_spaces(m[5],0)}
      TALLY
    end

    tally
  end

  def allocate_match_results(local:, visitor:, match_result:, matches_results:)
    # results default to a draw
    local_win = 0
    local_draw = 1
    local_loss = 0
    local_points = 1
    visitor_win = 0
    visitor_draw = 1
    visitor_loss = 0
    visitor_points = 1
    
    if match_result == 'win'
      local_win = 1
      local_draw = 0
      local_loss = 0
      local_points = 3
      visitor_win = 0
      visitor_draw = 0
      visitor_loss = 1
      visitor_points = 0
    elsif match_result == 'loss'
      local_win = 0
      local_draw = 0
      local_loss = 1
      local_points = 0
      visitor_win = 1
      visitor_draw = 0
      visitor_loss = 0
      visitor_points = 3
    end

    local_index = matches_results.index { |result| result[0] == local }
    visitor_index = matches_results.index { |result| result[0] == visitor }

    unless local_index.nil?
      mr = matches_results[local_index]
      mr[1] += 1 
      mr[2] += local_win 
      mr[3] += local_draw 
      mr[4] += local_loss 
      mr[5] += local_points 
    else
      matches_results << [local, 1, local_win, local_draw, local_loss, local_points]
    end

    unless visitor_index.nil?
      mr = matches_results[visitor_index]
      mr[1] += 1 
      mr[2] += visitor_win 
      mr[3] += visitor_draw 
      mr[4] += visitor_loss 
      mr[5] += visitor_points 
    else
      matches_results << [visitor, 1, visitor_win, visitor_draw, visitor_loss, visitor_points]
    end
  end

  def adjust_team_lead_spaces(str)
    max_spaces = 31
    spaces_to_add = max_spaces - str.length
    
    str + " " * spaces_to_add
  end

  def adjust_score_spaces(number, right_side_count = 1)
    max_spaces = 4
    length = number.to_s.length
    diff = max_spaces - length

    number.to_s.rjust(diff + (length - 1)).ljust(diff + (length - 1) + right_side_count)
  end
end