module Twitter
  module REST
    module DirectMessages
      def direct_messages_received(options = {} of String => String) : Array(Twitter::DirectMessage)
        response = get("/1.1/direct_messages.json", options)
        Array(Twitter::DirectMessage).from_json(response)
      end

      def direct_messages_sent(options = {} of String => String) : Array(Twitter::DirectMessage)
        response = get("/1.1/direct_messages/sent.json", options)
        Array(Twitter::DirectMessage).from_json(response)
      end

      def direct_message(id : Int32 | Int64, options = {} of String => String) : Twitter::DirectMessage
        options["id"] = id.to_s
        response = get("/1.1/direct_messages/show.json", options)
        Twitter::DirectMessage.from_json(response)
      end
    end
  end
end
