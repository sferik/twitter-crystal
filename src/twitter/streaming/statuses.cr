require "../delete"
require "../tweet"

module Twitter
  module Streaming
    module Statuses
      def filter(options = {} of String => String)
        delimeted_length = options.fetch("delimited", false)

        post("/1.1/statuses/filter.json", options) do |response|
          loop do
            json = if delimeted_length
                     bytes_to_read = response.gets.not_nil!.to_i
                     response.gets(bytes_to_read).not_nil!
                   else
                     response.gets.not_nil!
                   end

            yield parse_result(json)
          end
        end
      end

      def sample(options = {} of String => String, &block)
        delimeted_length = options.fetch("delimited", false)

        get("/1.1/statuses/sample.json", options) do |response|
          loop do
            json = if delimeted_length
                     bytes_to_read = response.gets.not_nil!.to_i
                     response.gets(bytes_to_read).not_nil!
                   else
                     response.gets.not_nil!
                   end

            yield parse_result(json)
          end
        end
      end

      def parse_result(json)
        (return Twitter::Tweet.from_json(json)) rescue nil
        (return Twitter::Delete.from_json(json, root: "delete")) rescue nil
      end
    end
  end
end
