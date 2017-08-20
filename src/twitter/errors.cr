require "json"

module Twitter
  struct Errors
    JSON.mapping({
      errors: Array(Twitter::Error),
    })
  end
end
