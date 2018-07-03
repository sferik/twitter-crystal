require "../helper"

describe Twitter::Version do
  describe "#to_s" do
    it "is in the form X.Y.Z" do
      Twitter::Version.to_s.split('.').size.should eq(3)
    end

    it "each segment of the string is in the right position" do
      x, y, z = Twitter::Version.to_s.split('.')
      x.to_i.should eq(Twitter::Version::MAJOR)
      y.to_i.should eq(Twitter::Version::MINOR)
      z.to_i.should eq(Twitter::Version::PATCH)
    end
  end
end
