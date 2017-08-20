require "../../helper"

describe Twitter::REST::Search do
  client = Mock::Client.new("CK", "CS", "AT", "AS", "UA")

  describe "#search" do
    context "called with String" do
      tweets = client.search("freebandnames")
      it "returns Array(Twitter::Tweet)" do
        tweets.should be_a Array(Twitter::Tweet)
        tweets[0].id.should eq 250075927172759552
        tweets[1].id.should eq 249292149810667520
      end
    end
  end
end
