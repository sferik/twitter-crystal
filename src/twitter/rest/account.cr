module Twitter
  module REST
    module Account
      def settings(options = {} of String => String)
        response = if options.size.zero?
                     get("/1.1/account/settings.json")
                   else
                     post("/1.1/account/settings.json", options)
                   end
        Twitter::Settings.from_json(response)
      end
    end
  end
end
