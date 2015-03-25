require "yelloyello_api/version"

require 'hashie'
require 'faraday_middleware'
module YelloyelloApi

  class Client

    attr_accessor :api_host, :api_version, :api_url, :api_key, :connection

    def initialize(username, password)
      @api_key = api_key
      @api_host = 'www.yelloyello.com'
      @api_version = 'v1'
      @api_url = "http://#{@api_host}/api/#{@api_version}"
      # More info: http://www.bjoernrochel.de/2013/02/09/oh-my-faraday/
      @connection = Faraday.new(url: api_url, headers: { accept: 'application/json' }) do |builder|
        builder.adapter   Faraday.default_adapter
        builder.basic_auth username, password
        # builder.request :basic_auth, username, password
        builder.params = { auth_token: api_key }

        builder.request   :json
        # builder.request   :basic_auth, options[:user], options[:password]
        builder.request   :retry

        builder.response  :mashify # Order seems important here :S
        builder.response  :json, :content_type => /\b(json|json-home)$/
      end
      @connection
    end

  end # /Client

end
