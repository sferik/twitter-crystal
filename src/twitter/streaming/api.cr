require "./statuses"

module Twitter
  module Streaming
    module API
      include Twitter::Streaming::Statuses
    end
  end
end
