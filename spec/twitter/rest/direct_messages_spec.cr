require "../../helper"

describe Twitter::REST::DirectMessages do
  client = Mock::Client.new("CK", "CS", "AT", "AS", "UA")

  describe "#direct_messages_received" do
    it "returns Array(Twitter::DirectMessage)" do
      client.direct_messages_received.should be_a Array(Twitter::DirectMessage)
      client.direct_messages_received.first.text.should eq "booyakasha"
    end
  end
end
