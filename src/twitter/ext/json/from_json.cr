# Converter for string timestamp_ms
module Time::EpochMillisConverterString
  def self.from_json(value : JSON::PullParser) : Time
    Time.epoch_ms(value.read_string.to_i64)
  end
end
