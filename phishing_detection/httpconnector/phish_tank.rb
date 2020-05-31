require 'httparty'
require 'base64'

module Httpconnector
  class PhishTank
    include HTTParty
    base_uri 'http://checkurl.phishtank.com'

    def self.is_phish_url?(url: )
      response = self.post("/checkurl/", {body: {url: Base64.encode64(url), format: 'json'}})
      if response.parsed_response["results"].nil?
        puts "*********** Unable to parse response ***********"
        puts response
        return false
      end
      return  response.parsed_response["results"]["in_database"] &&
              response.parsed_response["results"]["verified"] &&
              response.parsed_response["results"]["valid"]
    end
  end
end
