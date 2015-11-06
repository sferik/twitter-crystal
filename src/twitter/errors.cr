require "json"

module Twitter
  struct Errors
    JSON.mapping({
      errors: {type: Array(Twitter::Error)},
    })
  end
end
