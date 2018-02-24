require "json"

module Twitter
  class Tweet
    JSON.mapping({
      created_at:              {type: Time, converter: Time::Format.new("%a %b %d %T +0000 %Y")},
      favorite_count:          Int32?,
      favorited:               Bool,
      id:                      Int64,
      in_reply_to_screen_name: String?,
      in_reply_to_status_id:   Int64?,
      in_reply_to_user_id:     Int64?,
      lang:                    String?,
      place:                   Twitter::Place?,
      retweet_count:           Int32,
      retweeted:               Bool,
      retweeted_status:        Tweet?,
      source:                  String,
      text:                    String,
      truncated:               Bool,
      user:                    Twitter::User?,
    })
    def_equals id
  end
end
