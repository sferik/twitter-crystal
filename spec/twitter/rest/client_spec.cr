require "../../helper"

describe Twitter::REST::Client do
  describe "#initialize" do
    it "sets properties" do
      client = Twitter::REST::Client.new("CK", "CS", "AT", "AS", "UA")
      client.consumer_key.should eq("CK")
      client.consumer_secret.should eq("CS")
      client.access_token.should eq("AT")
      client.access_token_secret.should eq("AS")
      client.user_agent.should eq("UA")
    end
    it "sets default User-Agent when it is omitted" do
      client = Twitter::REST::Client.new("CK", "CS", "AT", "AS")
      client.user_agent.should eq("CrystalTwitterClient/#{Twitter::Version.to_s}")
    end
  end

  describe "#get" do
    pending "executes an HTTP GET" do
      client = Twitter::REST::Client.new("CK", "CS", "AT", "AS", "UA")
      path   = "/1.1/users/show.json"
      options = {"screen_name" => "sferik"}
      expect_raises(Twitter::Errors::ClientError, "Invalid or expired token") do
        client.get(path, options)
      end
    end
  end
end
