module Twitter
  module REST
    module DirectMessages
      def direct_messages_received(options = {} of String => String) : Twitter::DirectMessage
        response = get("/1.1/direct_messages.json", options)
        Twitter::DirectMessage.from_json(response)
      end
    end
  end
end
