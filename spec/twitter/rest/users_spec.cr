pending do
  describe Twitter::REST::Users do
    describe "#user" do
      client = Twitter::REST::Client.new("CK", "CS", "AT", "AS", "UA")

      context "without any args" do
        it "returns user: 7505382" do
          client.user.id.should eq 7505382
        end
      end

      context "with 776284343173906432" do
        it "returns user: 776284343173906432" do
          client.user(776284343173906432).id.should eq 776284343173906432
        end
      end

      context "with 'sferik'" do
        it "returns 7505382" do
          client.user("sferik").id.should eq 7505382
        end
      end
    end

    describe "#users" do
      client = Twitter::REST::Client.new("CK", "CS", "AT", "AS", "UA")

      context "with 'kenta_s_dev'" do
        users = client.users("kenta_s_dev")
        it "returns user: 776284343173906432" do
          users.size.should eq 1
          users.first.id.should eq 776284343173906432
        end
      end

      context "with 776284343173906432" do
        users = client.users(776284343173906432)
        it "returns user: 776284343173906432" do
          users.size.should eq 1
          users.first.id.should eq 776284343173906432
        end
      end

      context "with 'sferik'" do
        users = client.users("sferik")
        it "returns user: 7505382" do
          users.size.should eq 1
          users.first.id.should eq 7505382
        end
      end

      context "with 7505382" do
        users = client.users(7505382)
        it "returns user: 7505382" do
          users.size.should eq 1
          users.first.id.should eq 7505382
        end
      end
    end

    describe "#user_search" do
      client = Twitter::REST::Client.new("CK", "CS", "AT", "AS", "UA")

      context "with 'power zero-sum'" do
        users = client.user_search("power zero-sum")
        it "returns user: 7505382" do
          users.size.should eq 1
          users.first.id.should eq 7505382
        end
      end

      context "with 'Hello'" do
        users = client.user_search("Hello")
        it "returns user: 776284343173906432" do
          users.size.should eq 1
          users.first.id.should eq 776284343173906432
        end
      end
    end
  end
end
