module Twitter
  module Version
    Major = 0
    Minor = 1
    Patch = 0

    def self.to_s
      [Major, Minor, Patch].join('.')
    end
  end
end
