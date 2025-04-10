class Tournament
  def self.tally(games)
    matches = games.split("\n")
      .map {|m| m.split(";")}
      .each_with_object({}) do | match, results |
        local, visitor, match_result = match

        results[local] ||= { MP: 0, W: 0, D: 0, L: 0, P: 0}
        results[visitor] ||= { MP: 0, W: 0, D: 0, L: 0, P: 0}

        results[local][:MP] += 1
        results[visitor][:MP] += 1

        case match_result
        when "win"
          results[local][:P] += 3
          results[local][:W] += 1
          results[visitor][:L] += 1
        when "loss"
          results[visitor][:P] += 3
          results[visitor][:W] += 1
          results[local][:L] += 1
        when "draw"
          results[local][:D] += 1
          results[local][:P] += 1
          results[visitor][:D] += 1
          results[visitor][:P] += 1
        end
      end

    sorted_matches = matches.sort_by { |team, scores| [-scores[:P], team] }.to_h
    
    generate_tally(sorted_matches)
  end

  private

  def self.generate_tally(matches)
    tally = "Team                           | MP |  W |  D |  L |  P\n"
    
    matches.each do |team, scores|
      tally += format_line(team, scores)
    end

    tally
  end

  def self.format_line(team, scores)
    mp = scores[:MP].to_s.rjust(2)
    w = scores[:W].to_s.rjust(2)
    d = scores[:D].to_s.rjust(2)
    l = scores[:L].to_s.rjust(2)
    p = scores[:P].to_s.rjust(2)
    
    "#{team.ljust(30)} | #{mp} | #{w} | #{d} | #{l} | #{p}\n"
  end
end