require "json"
require "net/http"
require "oauth"
require "twitter/rest/timelines"
require "twitter/rest/users"
require "uri"

module Twitter
  module REST
    class Client
      include Twitter::REST::Users
      include Twitter::REST::Timelines
      Host = "api.twitter.com"
      Port = 443
      SSL  = true
      property :access_token, :access_token_secret, :consumer_key, :consumer_secret, :user_agent

      def initialize(@consumer_key : String, @consumer_secret : String, @access_token : String, @access_token_secret : String, @user_agent = nil : Nil | String)
        @user_agent ||= "CrystalTwitterClient/#{Twitter::Version.to_s}"
        @connection = HTTP::Client.new(Host, Port, SSL)
      end

      def get(path : String, params = {} of String => String)
        path += "?#{to_query_string(params)}" unless params.empty?
        exec("GET", path)
      end

      def post(path : String, params = {} of String => String)
        body = to_query_string(params)
        exec("POST", path, body)
      end

      private def exec(method : String, path : String, body = nil : String)
        request = HTTP::Request.new(method, path, HTTP::Headers.new, body)
        request.headers["Content-Type"] = "application/x-www-form-urlencoded"
        request.headers["Host"] = Host
        request.headers["Authorization"] = authorization_header(request)
        response = @connection.exec(request)
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

      private def authorization_header(request)
        signature = OAuth::Signature.new(consumer_key, consumer_secret, oauth_token: access_token, token_shared_secret: access_token_secret)
        nonce = (0...42).map { (('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a)[rand(62)] }.join
        timestamp = Time.now.to_i.to_s
        signature.authorization_header(request, SSL, timestamp, nonce)
      end

      private def to_query_string(hash : Hash)
        CGI.build_form do |form_builder|
          hash.each do |key, value|
            form_builder.add(key, value)
          end
        end
      end
    end
  end
end
