require "json"

module Twitter
  struct Error
    JSON.mapping({
      message: {type: String},
      code: {type: Int32},
    })
  end
end
