require "../../helper"

describe Twitter::REST::FriendsAndFollowers do
  client = Mock::Client.new("CK", "CS", "AT", "AS", "UA")

  describe "#follow" do
    context "called with Int32" do
      user = client.follow(12345)
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.name.should eq "Doug Williams"
      end
    end
    context "called with Int64" do
      user = client.follow(1234512345123451234)
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.name.should eq "Doug Williams"
      end
    end

    context "called with String" do
      user = client.follow("dougw")
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.name.should eq "Doug Williams"
      end
    end

    context "called with Twitter::User" do
      target_user = client.user("dougw")
      user = client.follow(target_user)
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.name.should eq "Doug Williams"
      end
    end
  end

  describe "#unfollow" do
    context "called with Int32" do
      user = client.unfollow(12345)
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.name.should eq "Doug Williams"
      end
    end

    context "called with Int64" do
      user = client.unfollow(1234512345123451234)
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.name.should eq "Doug Williams"
      end
    end

    context "called with String" do
      user = client.unfollow("dougw")
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.name.should eq "Doug Williams"
      end
    end

    context "called with Twitter::User" do
      target_user = client.user("dougw")
      user = client.unfollow(target_user)
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.name.should eq "Doug Williams"
      end
    end
  end

  describe "#friend_ids" do
    context "called without any args" do
      ids = client.friend_ids
      it "returns Array(Int64)" do
        ids.should be_a Array(Int64)
        ids.size.should eq 31
        ids[0].should eq 657693
        ids[10].should eq 1249881
      end
    end
  end

  describe "#follower_ids" do
    context "called without any args" do
      ids = client.follower_ids
      it "returns Array(Int64)" do
        ids.should be_a Array(Int64)
        ids.size.should eq 29
        ids[0].should eq 788892
        ids[10].should eq 1927800
      end
    end
  end
end
