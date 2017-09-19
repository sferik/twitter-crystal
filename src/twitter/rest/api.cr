require "./timelines"
require "./users"
require "./friends_and_followers"
require "./tweets"
require "./search"
require "./direct_messages"

module Twitter
  module REST
    module API
      include Twitter::REST::Users
      include Twitter::REST::Timelines
      include Twitter::REST::FriendsAndFollowers
      include Twitter::REST::Tweets
      include Twitter::REST::Search
      include Twitter::REST::DirectMessages
    end
  end
end
