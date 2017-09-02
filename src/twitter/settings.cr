require "json"

module Twitter
  class SleepTime
    JSON.mapping(
      enabled: Bool,
      end_time: String?,
      start_time: String?,
    )

    def initialize
      @enabled = false
    end
  end

  class TimeZone
    JSON.mapping(
      name: String?,
      utc_offset: Int32?,
      tzinfo_name: String?,
    )
  end

  class Settings
    JSON.mapping(
      sleep_time: SleepTime?,
      time_zone: TimeZone,
      protected: Bool?,
      screen_name: String,
      always_use_https: Bool?,
      use_cookie_personalization: Bool?,
      geo_enabled: Bool,
      language: String?,
      discoverable_by_email: Bool?,
      discoverable_by_mobile_phone: Bool?,
      display_sensitive_media: Bool?,
      allow_contributor_request: String?,
      allow_dms_from: String?,
      allow_dm_groups_from: String?,
      translator_type: String?,
    )

    def initialize
      @time_zone = TimeZone.new
      @screen_name = ""
      @geo_enabled = false
    end
  end
end
