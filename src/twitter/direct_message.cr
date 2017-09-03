module Twitter
  class DirectMessage
    JSON.mapping(
      id: Int64,
      id_str: String,
      recipient: Twitter::User,
      sender_id: Int64,
      sender_screen_name: String,
      text: String,
      created_at: {type: Time, converter: Time::Format.new("%a %b %d %T +0000 %Y")},
    )
  end
end
