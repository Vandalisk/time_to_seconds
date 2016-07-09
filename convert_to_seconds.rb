class StringToSecondsConverter
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def convert!
    final_seconds = splited_string.reduce(0) do |memo, count_name_pair|
      times_count = count_name_pair[0].to_i
      times_name = count_name_pair[1]
      found = false

      time_and_seconds.each do |time, seconds|
        if /#{time}/.match(times_name)
          memo += seconds * times_count
          found = true
          break
        end
      end
      found ? memo : break
    end
    puts final_seconds ? final_seconds : 'Wrong type of time. Please make sure that your input is right and try again.'
    final_seconds
  end

  def splited_string
    @splited_string ||= string.split(' ').enum_for(:each_slice, 2).to_a
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
