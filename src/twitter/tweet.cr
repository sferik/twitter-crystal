require "json"

module Twitter
  class Tweet
    json_mapping({
      created_at: {type: Time, converter: TimeFormat.new("%a %b %d %T +0000 %Y")},
      favorite_count: {type: Int32},
      favorited: {type: Bool},
      id: {type: Int64},
      in_reply_to_screen_name: {type: String, nilable: true},
      in_reply_to_status_id: {type: Int32, nilable: true},
      in_reply_to_user_id: {type: Int32, nilable: true},
      lang: {type: String},
      retweet_count: {type: Int32},
      retweeted: {type: Bool},
      retweeted_status: {type: Tweet, nilable: true},
      source: {type: String}
      text: {type: String},
      truncated: {type: Bool},
      user: {type: Twitter::User, nilable: true},
    })
    def_equals id
  end
end
