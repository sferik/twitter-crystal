require "json"

module Twitter
  struct Errors
    json_mapping({
      errors: {type: Array(Twitter::Error)},
    })
  end
end
