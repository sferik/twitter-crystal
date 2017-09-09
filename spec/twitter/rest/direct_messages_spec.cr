require "../../helper"

describe Twitter::REST::DirectMessages do
  client = Mock::Client.new("CK", "CS", "AT", "AS", "UA")

  describe "#direct_messages_received" do
    it "returns Array(Twitter::DirectMessage)" do
      client.direct_messages_received.should be_a Array(Twitter::DirectMessage)
      client.direct_messages_received.first.text.should eq "booyakasha"
    end
  end

  describe "#direct_messages_sent" do
    it "returns Array(Twitter::DirectMessage)" do
      client.direct_messages_sent.should be_a Array(Twitter::DirectMessage)
      client.direct_messages_sent.first.text.should eq "Meet me behind the cafeteria after school."
    end
  end

  describe "#direct_message" do
    context "id: Int32" do
      it "returns Array(Twitter::DirectMessage)" do
        client.direct_message(1).should be_a Twitter::DirectMessage
        client.direct_message(1).text.should eq "booyakasha"
      end
    end

    context "id: Int64" do
      it "returns Array(Twitter::DirectMessage)" do
        client.direct_message(123451234512345123).should be_a Twitter::DirectMessage
        client.direct_message(123451234512345123).text.should eq "booyakasha"
      end
    end
  end
end
