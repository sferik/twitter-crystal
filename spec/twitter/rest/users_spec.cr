require "../../helper"

describe Twitter::REST::Users do
  client = Mock::Client.new("CK", "CS", "AT", "AS", "UA")

  describe "#user" do

    context "without any args" do
      it "returns user: 7505382" do
        client.user.id.should eq 7505382
      end
    end

    context "with  7505382" do
      it "returns user:  7505382" do
        client.user.id.should eq 7505382
      end
    end

    context "with 'sferik'" do
      it "returns 7505382" do
        client.user("sferik").id.should eq 7505382
      end
    end
  end

  describe "#users" do
    context "with String" do
      users = client.users("hello")
      it "returns Array(Twitter::User)" do
        users.should be_a Array(Twitter::User)
        users[0].screen_name.should eq "sferik"
        users[1].screen_name.should eq "kenta_s_dev"
      end
    end

    context "with Int64" do
      users = client.users(123451234512345123)
      it "returns Array(Twitter::User)" do
        users.should be_a Array(Twitter::User)
        users[0].screen_name.should eq "sferik"
        users[1].screen_name.should eq "kenta_s_dev"
      end
    end

    context "with Int32" do
      users = client.users(12345)
      it "returns Array(Twitter::User)" do
        users.should be_a Array(Twitter::User)
        users[0].screen_name.should eq "sferik"
        users[1].screen_name.should eq "kenta_s_dev"
      end
    end
  end

  describe "#user_search" do
    context "with String" do
      users = client.user_search("Hello World")
      it "returns Array(Twitter::User)" do
        users.should be_a Array(Twitter::User)
        users[0].screen_name.should eq "sferik"
        users[1].screen_name.should eq "kenta_s_dev"
      end
    end
  end

  describe "#blocked" do
    blocked = client.blocked
    it "returns Array(Twitter::User)" do
      blocked.should be_a Array(Twitter::User)
      blocked[0].name.should eq "Javier Heady"
    end
  end

  describe "#blocked_ids" do
    blocked = client.blocked_ids
    it "returns Array(Int64)" do
      blocked.should be_a Array(Int64)
      blocked[0].should eq 123
    end
  end

  describe "#block?" do
    it { client.block?(123).should be_truthy }
    it { client.block?(776284343173906432).should be_truthy }
    it { client.block?(1234).should be_falsey }
    it { client.block?("any_user").should be_truthy }
  end

  describe "#block" do
    context "got String" do
      user = client.block("theSeanCook")
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.id.should eq 38895958
      end
    end

    context "got Int32" do
      user = client.block(38895958)
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.id.should eq 38895958
      end
    end

    context "got Int64" do
      user = client.block(776284343173906432)
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.id.should eq 38895958 # always returns the same id because `Twitter::REST::Client#get` is stubbed
      end
    end

    context "got Twitter::User" do
      user = client.block(client.user)
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.id.should eq 38895958
      end
    end
  end

  describe "#unblock" do
    context "got String" do
      user = client.unblock("theSeanCook")
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.id.should eq 38895958
      end
    end

    context "got Int32" do
      user = client.unblock(38895958)
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.id.should eq 38895958
      end
    end

    context "got Int64" do
      user = client.unblock(776284343173906432)
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.id.should eq 38895958 # always returns the same id because `Twitter::REST::Client#get` is stubbed
      end
    end

    context "got Twitter::User" do
      user = client.unblock(client.user)
      it "returns Twitter::User" do
        user.should be_a Twitter::User
        user.id.should eq 38895958
      end
    end
  end
end
