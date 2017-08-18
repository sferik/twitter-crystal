require "json"

module Twitter
  struct Error
    JSON.mapping({
      message: String,
      code: Int32
    })
  end
end
