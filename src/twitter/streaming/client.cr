require "http/client"
require "json"
require "oauth"
require "uri"

module Twitter
  module Streaming
    class Client
      include Twitter::Streaming::API

      Host = "stream.twitter.com"

      property access_token : String
      property access_token_secret : String
      property consumer_key : String
      property consumer_secret : String
      property user_agent : String?
      property http_client : HTTP::Client

      def initialize(@consumer_key, @consumer_secret, @access_token, @access_token_secret, @user_agent = nil, connect_timeout : Time::Span? = 30.seconds)
        @user_agent ||= "CrystalTwitterClient/#{Twitter::Version.to_s}"
        consumer = OAuth::Consumer.new(Host, consumer_key, consumer_secret)
        access_token = OAuth::AccessToken.new(access_token, access_token_secret)
        @http_client = HTTP::Client.new(Host, tls: true)
        @http_client.connect_timeout = connect_timeout if connect_timeout
        consumer.authenticate(http_client, access_token)
      end

      def get(path : String, params = {} of String => String, &block)
        path += "?#{to_query_string(params)}" unless params.empty?
        http_client.get(path) do |response|
          yield handle_response(response)
        end
      end

      def post(path : String, form = {} of String => String, &block)
        http_client.post(path, form: form) do |response|
          yield handle_response(response)
        end
      end

      private def handle_response(response : HTTP::Client::Response)
        case response.status_code
        when 200..299
          response.body_io
        when 400..499
          message = Twitter::Errors.from_json(response.body).errors.first.message
          raise Twitter::Errors::ClientError.new(message)
        when 502
          raise Twitter::Errors::ServerError.new("Bad Gateway")
        when 503
          raise Twitter::Errors::ServerError.new("Service Unavailable")
        when 504
          raise Twitter::Errors::ServerError.new("Gateway Timeout")
        else
          raise Twitter::Errors::ServerError.new("Internal Server Error")
        end
      end

      private def to_query_string(hash : Hash)
        HTTP::Params.build do |form_builder|
          hash.each do |key, value|
            form_builder.add(key, value)
          end
        end
      end
    end
  end
end
