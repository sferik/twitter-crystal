require "json"
require "../user"

module Twitter
  module REST
    module FriendsAndFollowers
      def follow(user_id : Int64, options = {} of String => String) : Twitter::User
        response = post("/1.1/friendships/create.json", options.merge({ "user_id" => user_id.to_s }))
        Twitter::User.from_json(response)
      end

      def follow(screen_name : String, options = {} of String => String) : Twitter::User
        response = post("/1.1/friendships/create.json", options.merge({ "screen_name" => screen_name }))
        Twitter::User.from_json(response)
      end

      def follow(user : Twitter::User, options = {} of String => String) : Twitter::User
        follow(user.id, options)
      end

      def unfollow(user_id : Int64, options = {} of String => String) : Twitter::User
        response = post("/1.1/friendships/destroy.json", options.merge({ "user_id" => user_id.to_s }))
        Twitter::User.from_json(response)
      end

      def unfollow(screen_name : String, options = {} of String => String) : Twitter::User
        response = post("/1.1/friendships/destroy.json", options.merge({ "screen_name" => screen_name }))
        Twitter::User.from_json(response)
      end

      def unfollow(user : Twitter::User, options = {} of String => String) : Twitter::User
        unfollow(user.id, options)
      end
    end
  end
end
