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

    matches.each do |match|

      team_one = match[0]
      team_two = match[1]
      result = match[2]
      
      r = self.allocate_match_results(local: team_one, visitor: team_two, match_result: result)

      tally << <<~TALLY
        #{self.adjust_line_format(r[0][0])}|  #{r[0][1]} |  #{r[0][2]} |  #{r[0][3]} |  #{r[0][4]} |  #{r[0][5]}
        #{self.adjust_line_format(r[1][0])}|  #{r[1][1]} |  #{r[1][2]} |  #{r[1][3]} |  #{r[1][4]} |  #{r[1][5]}
      TALLY

    end

    tally
  end

  def allocate_match_results(local:, visitor:, match_result:)
    local_win = 0
    local_draw = 0
    local_loss = 0
    local_points = 0
    visitor_win = 0
    visitor_draw = 0
    visitor_loss = 0
    visitor_points = 0
    
    if match_result == 'draw'
      local_win += 0
      local_draw += 1
      local_loss += 0
      local_points += 1
      visitor_win += 0
      visitor_draw += 1
      visitor_loss += 0
      visitor_points += 1
    elsif match_result == 'win'
      local_win += 1
      local_draw += 0
      local_loss += 0
      local_points += 3
      visitor_win += 0
      visitor_draw += 0
      visitor_loss += 1
      visitor_points += 0
    else
      local_win += 0
      local_draw += 0
      local_loss += 1
      local_points += 0
      visitor_win += 1
      visitor_draw += 0
      visitor_loss += 0
      visitor_points += 3
    end
    
    results = [
      [local, 1, local_win, local_draw, local_loss, local_points], 
      [visitor, 1, visitor_win, visitor_draw, visitor_loss, visitor_points]
    ]

    results
  end

  def adjust_line_format(str)
    max_spaces = 31
    spaces_to_add = max_spaces - str.length
    
    str << " " * spaces_to_add
  end
end