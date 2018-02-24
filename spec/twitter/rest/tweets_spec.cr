require "../../helper"

describe Twitter::REST::Tweets do
  client = Mock::Client.new("CK", "CS", "AT", "AS", "UA")

  describe "#update" do
    context "called with String" do
      tweet = client.update("Maybe he'll finally find his keys. #peterfalk")
      it "returns Twitter::Tweet" do
        tweet.should be_a Twitter::Tweet
        tweet.id.should eq 243145735212777472
      end
    end
  end

  describe "#status" do
    context "called with Int32" do
      tweet = client.status(12345)
      it "returns Twitter::Tweet" do
        tweet.should be_a Twitter::Tweet
        tweet.text.should eq "\"Vimeo integrates with Dropbox for easier video uploads and shares\": http://t.co/7UlkvZzM"
      end
    end

    context "called with Int64" do
      tweet = client.status(240854986559455234)
      it "returns Twitter::Tweet" do
        tweet.should be_a Twitter::Tweet
        tweet.text.should eq "\"Vimeo integrates with Dropbox for easier video uploads and shares\": http://t.co/7UlkvZzM"
      end
    end

    context "Tweet with Twitter Place" do
      tweet = client.status(240854986559455234)
      it "returns Twitter::Tweet with Twitter::Place" do
        tweet.should be_a Twitter::Tweet
        tweet.place.should be_a Twitter::Place?

        place = tweet.place.not_nil!
        place.name.should eq "McIntosh Lake"
        place.country.should eq "United States"
      end
    end
  end

  describe "#destroy_status" do
    context "called with Int32" do
      tweet = client.destroy_status(12345)
      it "returns Twitter::Tweet" do
        tweet.should be_a Twitter::Tweet
        tweet.text.should eq "\"Vimeo integrates with Dropbox for easier video uploads and shares\": http://t.co/7UlkvZzM"
      end
    end

    context "called with Int64" do
      tweet = client.destroy_status(240854986559455234)
      it "returns Twitter::Tweet" do
        tweet.should be_a Twitter::Tweet
        tweet.text.should eq "\"Vimeo integrates with Dropbox for easier video uploads and shares\": http://t.co/7UlkvZzM"
      end
    end

    context "called with Twitter::Tweet" do
      tweet = client.destroy_status(client.update("hello"))
      it "returns Twitter::Tweet" do
        tweet.should be_a Twitter::Tweet
        tweet.id.should eq 240854986559455234
      end
    end
  end

  describe "#retweet" do
    context "called with Int32" do
      tweet = client.retweet(12345)
      it "returns Twitter::Tweet" do
        tweet.should be_a Twitter::Tweet
        tweet.text.should eq "RT @kurrik: tcptrace and imagemagick - two command line tools TOTALLY worth learning"
      end
    end

    context "called with Int64" do
      tweet = client.retweet(243149503589400576)
      it "returns Twitter::Tweet" do
        tweet.should be_a Twitter::Tweet
        tweet.text.should eq "RT @kurrik: tcptrace and imagemagick - two command line tools TOTALLY worth learning"
      end
    end

    context "called with Twitter::Tweet" do
      tweet = client.retweet(client.update("hello"))
      it "returns Twitter::Tweet" do
        tweet.should be_a Twitter::Tweet

        # always returns the same text because Twitter::REST::Client#post is stubbed
        tweet.text.should eq "RT @kurrik: tcptrace and imagemagick - two command line tools TOTALLY worth learning"
      end
    end
  end

  describe "#unretweet" do
    context "called with Int32" do
      tweet = client.unretweet(12345)
      it "returns Twitter::Tweet" do
        tweet.should be_a Twitter::Tweet
        tweet.text.should eq "Happy holidays from all of us @twitterdev! Here's to an exciting 2016!"
      end
    end

    context "called with Int64" do
      tweet = client.unretweet(243149503589400576)
      it "returns Twitter::Tweet" do
        tweet.should be_a Twitter::Tweet
        tweet.text.should eq "Happy holidays from all of us @twitterdev! Here's to an exciting 2016!"
      end
    end

    context "called with Twitter::Tweet" do
      tweet = client.unretweet(client.update("hello"))
      it "returns Twitter::Tweet" do
        tweet.should be_a Twitter::Tweet

        # always returns the same text because Twitter::REST::Client#post is stubbed
        tweet.text.should eq "Happy holidays from all of us @twitterdev! Here's to an exciting 2016!"
      end
    end
  end
end
