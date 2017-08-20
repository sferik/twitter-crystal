require "../../helper"

describe Twitter::REST::Timelines do
  client = Mock::Client.new("CK", "CS", "AT", "AS", "UA")

  describe "#home_timeline" do
    context "called without any args" do
      timeline = client.home_timeline
      it "returns Array(Twitter::Tweet)" do
        timeline.should be_a Array(Twitter::Tweet)
        timeline[0].text.should eq "just another test"
        timeline[1].text.should eq "lecturing at the \"analyzing big data with twitter\" class at @cal with @othman  http://t.co/bfj7zkDJ"
      end
    end
  end

  describe "#mentions_timeline" do
    context "called without any args" do
      timeline = client.mentions_timeline
      it "returns Array(Twitter::Tweet)" do
        timeline.should be_a Array(Twitter::Tweet)
        timeline[0].text.should eq "@jasoncosta @themattharris Hey! Going to be in Frisco in October. Was hoping to have a meeting to talk about @thinkwall if you're around?"
        timeline[1].text.should eq "Got the shirt @jasoncosta thanks man! Loving the #twitter bird on the shirt :-)"
      end
    end
  end

  describe "#retweets_of_me" do
    context "called without any args" do
      timeline = client.retweets_of_me
      it "returns Array(Twitter::Tweet)" do
        timeline.should be_a Array(Twitter::Tweet)
        timeline[0].text.should eq "It's bring your migraine to work day today!"
      end
    end
  end

  describe "#user_timeline" do
    context "called with String" do
      timeline = client.user_timeline("kenta_s_dev")
      it "returns Array(Twitter::Tweet)" do
        timeline.should be_a Array(Twitter::Tweet)
        timeline[0].text.should eq "RT @TwitterDev: 1/ Today we’re sharing our vision for the future of the Twitter API platform!\nhttps://t.co/XweGngmxlP"
        timeline[1].text.should eq "RT @TwitterMktg: Starting today, businesses can request and share locations when engaging with people in Direct Messages. https://t.co/rpYn…"
      end
    end

    context "called with Int32" do
      timeline = client.user_timeline(12345)
      it "returns Array(Twitter::Tweet)" do
        timeline.should be_a Array(Twitter::Tweet)
        timeline[0].text.should eq "RT @TwitterDev: 1/ Today we’re sharing our vision for the future of the Twitter API platform!\nhttps://t.co/XweGngmxlP"
        timeline[1].text.should eq "RT @TwitterMktg: Starting today, businesses can request and share locations when engaging with people in Direct Messages. https://t.co/rpYn…"
      end
    end

    context "called with Int64" do
      timeline = client.user_timeline(1234512345123451234)
      it "returns Array(Twitter::Tweet)" do
        timeline.should be_a Array(Twitter::Tweet)
        timeline[0].text.should eq "RT @TwitterDev: 1/ Today we’re sharing our vision for the future of the Twitter API platform!\nhttps://t.co/XweGngmxlP"
        timeline[1].text.should eq "RT @TwitterMktg: Starting today, businesses can request and share locations when engaging with people in Direct Messages. https://t.co/rpYn…"
      end
    end
  end
end
