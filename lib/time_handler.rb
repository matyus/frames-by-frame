class TimeHandler
  def self.build
    new
  end

  def increment

  end

  def get_timestamp
    @previous_timestamp = Film.find(1).timestamp

    return "T -- #{@previous_timestamp}"
  end

  def set_timestamp
    timestamp = @previous_timestamp.dup.split('.')

    updated = "#{timestamp[0]}.#{timestamp[1].to_i + 30}"

    File.open('timestamp', 'w') { |file| file << updated }

    return  "U -- #{updated}"
  end

  def display
    timestamp = @previous_timestamp.dup.split('.')

    return "D -- #{Time.parse(timestamp[0])}, #{timestamp[1].to_i}"
  end
end
