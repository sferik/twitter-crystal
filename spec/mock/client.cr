module Mock
  class Client < Twitter::REST::Client
    def initialize(@consumer_key : String, @consumer_secret : String, @access_token : String, @access_token_secret : String, @user_agent : Nil | String = nil)
      @http_client = HTTP::Client.new("localhost")
    end

    def get(path : String, params = {} of String => String)
      JSON.parse(File.read("spec/mock#{path}")).to_json
    end

    def post(path : String, form = {} of String => String)
      JSON.parse(File.read("spec/mock#{path}")).to_json
    end
  end
end
