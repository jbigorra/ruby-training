module ResistorColorDuo
  COLOR_CODES = Hash[
    'black',  0,
    'brown',  1,
    'red',    2,
    'orange', 3,
    'yellow', 4,
    'green',  5,
    'blue',   6,
    'violet', 7,
    'grey',   8,
    'white',  9,
  ]
  
  def self.value(colors)
    color_1, color_2 = colors
    
    (COLOR_CODES[color_1].to_s << COLOR_CODES[color_2].to_s).to_i
  end
end
