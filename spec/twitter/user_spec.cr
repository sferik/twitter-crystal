require "../helper"

describe Twitter::User do
  describe ".from_json" do
    it "parses all attributes correctly" do
      json = JSON.parse(File.read("./spec/fixtures/users.json"))[0].to_json
      user = Twitter::User.from_json(json)
      user.created_at.should eq(Time.parse("Mon Jul 16 12:59:01 +0000 2007", "%a %b %d %T +0000 %Y", Time::Location::UTC))
      user.default_profile.should eq(false)
      user.default_profile_image.should eq(false)
      user.favourites_count.should eq(14447)
      user.followers_count.should eq(5945)
      user.friends_count.should eq(881)
      user.id.should eq(7505382)
      user.listed_count.should eq(339)
      user.location.should eq("Berlin")
      user.name.should eq("Erik Michaels-Ober")
      user.needs_phone_verification.should eq(false)
      user.profile_banner_url.should eq("https://pbs.twimg.com/profile_banners/7505382/1425238640")
      user.profile_image_url_https.should eq("https://pbs.twimg.com/profile_images/583426225605058560/dO_rpWw1_normal.jpg")
      user.protected.should eq(false)
      user.screen_name.should eq("sferik")
      user.status.should be_a(Twitter::Tweet)
      user.statuses_count.should eq(17358)
      user.suspended.should eq(false)
      user.url.should eq("https://t.co/L2xIBazeZH")
      user.verified.should eq(false)
    end
  end
end
