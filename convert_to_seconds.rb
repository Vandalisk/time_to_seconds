class StringToSecondsConverter

  def initialize(string)
    @string = string
  end

  def convert!
    final_seconds = 0

    time_and_seconds.each do |time, seconds|
      splited_string = @string.split(' ' + time.to_s)
      if /[A-Za-z]+/.match(splited_string[0])
        number = 0
        @string = splited_string[0]
      else
        number = splited_string[0].to_i rescue 0
        @string = next_string(splited_string)
      end
      final_seconds += seconds * number
    end

    puts final_seconds

    final_seconds
  end

  def next_string(splited_string)
    if splited_string[1]
      splited_string[1][0] == 's' ? splited_string[1][1..-1] : splited_string[1]
    else
      ''
    end
  end

  def time_and_seconds
    {
      year: 31536000,
      month: 2592000,
      day: 86400,
      hour: 3600,
      minute: 60,
      second: 1
    }
  end
end

StringToSecondsConverter.new(ARGV[0]).convert!
