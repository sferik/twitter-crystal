module Twitter
  module Version
    MAJOR = 0
    MINOR = 2
    PATCH = 1

    def self.to_s
      [MAJOR, MINOR, PATCH].join('.')
    end
  end
end
