require "json"
require "./ext/json/from_json"
require "./status"

module Twitter
  class Delete
    JSON.mapping(
      status: Status,
      timestamp_ms: {type: Time, converter: Time::EpochMillisConverterString},
    )
  end
end
