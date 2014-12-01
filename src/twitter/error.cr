require "json"

module Twitter
  struct Error
    json_mapping({
      message: {type: String},
      code: {type: Int32},
    })
  end
end
