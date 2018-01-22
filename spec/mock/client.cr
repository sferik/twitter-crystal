module Mock
  class Client < Twitter::REST::Client
    def initialize(@consumer_key : String, @consumer_secret : String, @access_token : String, @access_token_secret : String, @user_agent : Nil | String = nil)
      @http_client = HTTP::Client.new("localhost")
    end

    def get(path : String, params = {} of String => String)
      File.read("spec/mock#{path}")
    end

    def post(path : String, form = {} of String => String)
      File.read("spec/mock#{path}")
    end
  end

  class DummyHttpClient < HTTP::Client
    def initialize(@host : String = "localhost")
      @port = 65535
      @compress = false
    end

    def get(path : String)
      HTTP::Client::Response.new(400, %({"errors":[{"code":400,"message":"Invalid or expired token"}]}))
    end

    def post(path : String, form = {} of String => String)
      HTTP::Client::Response.new(400, %({"errors":[{"code":400,"message":"Invalid or expired token"}]}))
    end
  end

  class ClientWithDummyHttpClient < Twitter::REST::Client
    def initialize(@consumer_key : String, @consumer_secret : String, @access_token : String, @access_token_secret : String, @user_agent : Nil | String = nil)
      @http_client = DummyHttpClient.new("localhost")
    end
  end
end
