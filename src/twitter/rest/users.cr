module Twitter
  module REST
    module Users
      def user(options = {} of String => String)
        response = get("/1.1/account/verify_credentials.json", options)
        Twitter::User.from_json(response)
      end

      def user(user_id : Int32, options = {} of String => String)
        response = get("/1.1/users/show.json", options.merge({"user_id" => user_id.to_s}))
        Twitter::User.from_json(response)
      end

      def user(screen_name : String, options = {} of String => String)
        response = get("/1.1/users/show.json", options.merge({"screen_name" => screen_name}))
        Twitter::User.from_json(response)
      end

      def user_search(query : String, options = {} of String => String)
        response = get("/1.1/users/search.json", options.merge({"q" => query}))
        Array(Twitter::User).from_json(response)
      end

      def users(user_ids : Array(Int32), options = {} of String => String)
        response = post("/1.1/users/lookup.json", options.merge({"user_id" => user_ids.join(',')}))
        Array(Twitter::User).from_json(response)
      end

      def users(screen_names : Array(String), options = {} of String => String)
        response = post("/1.1/users/lookup.json", options.merge({"screen_name" => screen_names.join(',')}))
        Array(Twitter::User).from_json(response)
      end
    end
  end
end
