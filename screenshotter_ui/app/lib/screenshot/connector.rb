require 'json'
require 'rest-client'

module Screenshot
  class Connector
    def initialize
      @destination = APP_CONFIG['api']['url']
      @token = APP_CONFIG['api']['token']
    end

    def send_url(url)
      RestClient.post(@destination, { url: url }, auth_headers)
      true
    rescue StandardError => e
      warn("Failed to send url #{url} to #{@destination}: #{e}")
      false
    end

    def screenshots
      response = RestClient.get(@destination, auth_headers)
      JSON.parse(response.body)
    rescue StandardError => e
      warn("Failed to get screenshots! #{e}")
      []
    end

    private

    def auth_headers
      {
        Authorization: "Token token=#{@token}"
      }
    end
  end
end