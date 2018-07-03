require "../cursor"

module Twitter
  module REST
    module Users
      def settings(options = {} of String => String)
        response = if options.size.zero?
                     get("/1.1/account/settings.json")
                   else
                     post("/1.1/account/settings.json", options)
                   end
        Twitter::Settings.from_json(response)
      end

      def user(options = {} of String => String) : Twitter::User
        response = get("/1.1/account/verify_credentials.json", options)
        Twitter::User.from_json(response)
      end

      def user(user_id : Int32 | Int64, options = {} of String => String) : Twitter::User
        response = get("/1.1/users/show.json", options.merge({"user_id" => user_id.to_s}))
        Twitter::User.from_json(response)
      end

      def user(screen_name : String, options = {} of String => String) : Twitter::User
        response = get("/1.1/users/show.json", options.merge({"screen_name" => screen_name}))
        Twitter::User.from_json(response)
      end

      def user_search(query : String, options = {} of String => String) : Array(Twitter::User)
        response = get("/1.1/users/search.json", options.merge({"q" => query}))
        Array(Twitter::User).from_json(response)
      end

      def users(*user_ids : Int32 | Int64, options = {} of String => String) : Array(Twitter::User)
        response = post("/1.1/users/lookup.json", options.merge({"user_id" => user_ids.join(',')}))
        Array(Twitter::User).from_json(response)
      end

      def users(*screen_names : String, options = {} of String => String) : Array(Twitter::User)
        response = post("/1.1/users/lookup.json", options.merge({"screen_name" => screen_names.join(',')}))
        Array(Twitter::User).from_json(response)
      end

      def blocked(options = {} of String => String) : Array(Twitter::User)
        response = get("/1.1/blocks/list.json", options)
        Array(Twitter::User).from_json(JSON.parse(response)["users"].to_json)
      end

      def blocked_ids(options = {} of String => String) : Array(Int64)
        response = get("/1.1/blocks/ids.json", options)
        JSON.parse(response)["ids"].as_a.map(&.as_i64)
      end

      def block?(user_id : Int32 | Int64, options = {} of String => String) : Bool
        blocked_ids(options).includes?(user_id)
      end

      def block?(user : Twitter::User, options = {} of String => String) : Bool
        blocked_ids(options).includes?(user.id)
      end

      def block?(screen_name : String, options = {} of String => String) : Bool
        block?(user(screen_name))
      end

      def block(screen_name : String, options = {} of String => String) : Twitter::User
        response = post("/1.1/blocks/create.json", options.merge({"screen_name" => screen_name}))
        Twitter::User.from_json(response)
      end

      def block(user_id : Int32 | Int64, options = {} of String => String) : Twitter::User
        response = post("/1.1/blocks/create.json", options.merge({"user_id" => user_id.to_s}))
        Twitter::User.from_json(response)
      end

      def block(user : Twitter::User, options = {} of String => String) : Twitter::User
        block(user.id)
      end

      def unblock(screen_name : String, options = {} of String => String) : Twitter::User
        response = post("/1.1/blocks/destroy.json", options.merge({"screen_name" => screen_name}))
        Twitter::User.from_json(response)
      end

      def unblock(user_id : Int32 | Int64, options = {} of String => String) : Twitter::User
        response = post("/1.1/blocks/destroy.json", options.merge({"user_id" => user_id.to_s}))
        Twitter::User.from_json(response)
      end

      def unblock(user : Twitter::User, options = {} of String => String) : Twitter::User
        unblock(user.id)
      end

      def update_profile(options = {} of String => String) : Twitter::User
        response = post("/1.1/account/update_profile.json", options)
        Twitter::User.from_json(response)
      end

      def update_profile_background_image(options = {} of String => String) : Twitter::User
        response = post("/1.1/account/update_profile_background_image.json", options)
        Twitter::User.from_json(response)
      end

      def update_profile_image(base64_string : String, options = {} of String => String) : Twitter::User
        response = post("/1.1/account/update_profile_image.json", options.merge({"image" => base64_string}))
        Twitter::User.from_json(response)
      end

      def update_profile_banner(base64_string : String, options = {} of String => String) : Void
        post("/1.1/account/update_profile_banner.json", options.merge({"banner" => base64_string}))
        Void # this API returns an empty body, so this method returns nothing
      end

      def mute(options = {} of String => String) : Twitter::User
        response = post("/1.1/mutes/users/create.json", options)
        Twitter::User.from_json(response)
      end

      def unmute(options = {} of String => String) : Twitter::User
        response = post("/1.1/mutes/users/destroy.json", options)
        Twitter::User.from_json(response)
      end
    end
  end
end
