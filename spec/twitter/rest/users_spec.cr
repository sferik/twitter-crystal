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
end
