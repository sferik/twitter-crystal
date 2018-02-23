module Twitter
  module REST
    module Tweets # a.k.a Statuses
      def update(status : String, options = {} of String => String) : Twitter::Tweet
        response = post("/1.1/statuses/update.json", options.merge({"status" => status}))
        Twitter::Tweet.from_json(response)
      end

      def destroy_status(tweet_id : Int32 | Int64, options = {} of String => String) : Twitter::Tweet
        response = post("/1.1/statuses/destroy.json", options.merge({"id" => tweet_id.to_s}))
        Twitter::Tweet.from_json(response)
      end

      def destroy_status(tweet : Twitter::Tweet, options = {} of String => String) : Twitter::Tweet
        destroy_status(tweet.id, options)
      end

      def retweet(tweet_id : Int32 | Int64, options = {} of String => String) : Twitter::Tweet
        response = post("/1.1/statuses/retweet.json", options.merge({"id" => tweet_id.to_s}))
        Twitter::Tweet.from_json(response)
      end

      def retweet(tweet : Twitter::Tweet, options = {} of String => String) : Twitter::Tweet
        retweet(tweet.id)
      end

      def unretweet(tweet_id : Int32 | Int64, options = {} of String => String) : Twitter::Tweet
        response = post("/1.1/statuses/unretweet.json", options.merge({"id" => tweet_id.to_s}))
        Twitter::Tweet.from_json(response)
      end

      def unretweet(tweet : Twitter::Tweet, options = {} of String => String) : Twitter::Tweet
        unretweet(tweet.id)
      end

      # Fetch a particular Tweet by *id*
      def status(id : Int32 | Int64) : Twitter::Tweet
        response = get("/1.1/statuses/show.json", {"id" => id.to_s})
        Twitter::Tweet.from_json(response)
      end
    end
  end
end
