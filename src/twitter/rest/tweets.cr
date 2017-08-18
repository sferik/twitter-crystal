module Twitter
  module REST
    module Tweets
      def update(status : String, options = {} of String => String) : Twitter::Tweet
        response = post("/1.1/statuses/update.json", options.merge({ "status" => status }))
        Twitter::Tweet.from_json(response)
      end

      def destroy_status(tweet_id : Int32 | Int64, options = {} of String => String) : Twitter::Tweet
        response = post("/1.1/statuses/destroy/#{tweet_id}.json", options)
        Twitter::Tweet.from_json(response)
      end

      def destroy_status(tweet : Twitter::Tweet, options = {} of String => String) : Twitter::Tweet
        destroy_status(tweet.id, options)
      end
    end
  end
end
