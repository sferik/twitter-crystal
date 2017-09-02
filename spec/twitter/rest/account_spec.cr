require "../../helper"

describe Twitter::REST::Account do
  client = Mock::Client.new("CK", "CS", "AT", "AS", "UA")

  describe "#settings" do
    settings = client.settings
    context "called with no args" do
      it "returns Twitter::Settings" do
        settings.should be_a Twitter::Settings
        settings.screen_name.should eq "theSeanCook"
      end
    end

    context "called with no args" do
      options =  { "time_zone" => "Pacific Time (US & Canada)" }
      settings = client.settings(options)
      it "returns Twitter::Settings" do
        settings.should be_a Twitter::Settings
        settings.screen_name.should eq "theSeanCook"
        settings.time_zone.name.should eq "Pacific Time (US & Canada)"
      end
    end
  end
end
