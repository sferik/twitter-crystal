require "./timelines"
require "./users"
require "http/client"
require "json"
require "oauth"
require "uri"

module Twitter
  module REST
    class Client
      include Twitter::REST::Users
      include Twitter::REST::Timelines
      Host = "api.twitter.com"
      property :access_token, :access_token_secret, :consumer_key, :consumer_secret, :user_agent

      def initialize(@consumer_key : String, @consumer_secret : String, @access_token : String, @access_token_secret : String, @user_agent : Nil | String = nil)
        @user_agent ||= "CrystalTwitterClient/#{Twitter::Version.to_s}"
        consumer = OAuth::Consumer.new(Host, consumer_key, consumer_secret)
        access_token = OAuth::AccessToken.new(access_token, access_token_secret)
        @http_client = HTTP::Client.new(Host, tls: true)
        consumer.authenticate(@http_client, access_token)
      end

      def get(path : String, params = {} of String => String)
        path += "?#{to_query_string(params)}" unless params.empty?
        response = @http_client.get(path)
        handle_response(response)
      end

      def post(path : String, form = {} of String => String)
        response = @http_client.post_form(path, form)
        handle_response(response)
      end

      private def handle_response(response : HTTP::Client::Response)
        case response.status_code
        when 200..299
          response.body
        when 400..499
          message = Twitter::Errors.from_json(response.body).errors.first.message
          raise Twitter::Errors::ClientError.new(message)
        when 500
          raise Twitter::Errors::ServerError.new("Internal Server Error")
        when 502
          raise Twitter::Errors::ServerError.new("Bad Gateway")
        when 503
          raise Twitter::Errors::ServerError.new("Service Unavailable")
        when 504
          raise Twitter::Errors::ServerError.new("Gateway Timeout")
        else
          ""
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
