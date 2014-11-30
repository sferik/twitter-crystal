require "../helper"

describe Twitter::Version do
  it "is 0.0.1" do
    Twitter::Version.should eq("0.0.1")
  end
end
