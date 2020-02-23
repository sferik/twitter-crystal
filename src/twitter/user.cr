require "json"

module Twitter
  class User
    JSON.mapping({
      created_at:                         {type: Time, converter: Time::Format.new("%a %b %d %T +0000 %Y")},
      default_profile:                    Bool,
      default_profile_image:              Bool,
      favourites_count:                   Int32,
      followers_count:                    Int32,
      friends_count:                      Int32,
      id:                                 Int64,
      listed_count:                       Int32,
      location:                           String?,
      name:                               String,
      needs_phone_verification:           Bool?,
      profile_banner_url:                 String?,
      profile_image_url_https:            String?,
      protected:                          Bool,
      screen_name:                        String,
      status:                             Twitter::Tweet?,
      statuses_count:                     Int32,
      suspended:                          Bool?,
      url:                                String?,
      verified:                           Bool,
      description:                        String?,
    })
    def_equals id
  end
end
