require "json"

module Twitter
  class Cursor
    JSON.mapping(
      next_cursor: Int64,
      next_cursor_str: String,
      previous_cursor: Int64,
      previous_cursor_str: String
    )
  end
end
