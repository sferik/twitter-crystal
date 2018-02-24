require "json"

module Twitter
  class Place
    JSON.mapping({
      id:           String,
      url:          String,
      place_type:   String,
      name:         String,
      full_name:    String,
      country_code: String,
      country:      String,
    })
  end
end
