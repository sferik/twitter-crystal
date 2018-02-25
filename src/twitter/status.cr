require "json"

module Twitter
  class Status
    JSON.mapping(
      id: Int64,
      id_str: String,
      user_id: Int64,
      user_id_str: String,
    )
  end
end
