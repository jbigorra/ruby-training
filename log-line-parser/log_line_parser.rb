class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.sub(/\[(ERROR|WARNING|INFO)\]\: /, "").strip
  end

  def log_level
    @line.split(']').first.delete('[]').downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
