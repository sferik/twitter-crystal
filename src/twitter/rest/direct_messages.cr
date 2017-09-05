module Twitter
  module REST
    module DirectMessages
      def direct_messages_received(options = {} of String => String) : Array(Twitter::DirectMessage)
        response = get("/1.1/direct_messages.json", options)
        Array(Twitter::DirectMessage).from_json(response)
      end
    end
  end
end
