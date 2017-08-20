module Twitter
  module REST
    module Search
      def search(q : String, options = {} of String => String) : Array(Twitter::Tweet)
        response = get("/1.1/search/tweets.json", options.merge({ "q" => q }))
        Array(Twitter::Tweet).from_json(JSON.parse(response)["statuses"].to_json)
      end
    end
  end
end
