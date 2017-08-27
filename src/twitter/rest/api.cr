require "./timelines"
require "./users"
require "./friends_and_followers"
require "./tweets"
require "./search"

module Twitter
  module REST
    module API
      include Twitter::REST::Users
      include Twitter::REST::Timelines
      include Twitter::REST::FriendsAndFollowers
      include Twitter::REST::Tweets
      include Twitter::REST::Search
    end
  end
end
