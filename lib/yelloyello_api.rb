require "yelloyello_api/version"

require 'forwardable'

require 'hashie'
require 'faraday_middleware'
module YelloyelloApi

  class Client

    attr_accessor :api_host, :api_version, :connection

    extend Forwardable
    delegate [:get, :put, :patch, :post] => :connection

    def initialize(options = {})
      @api_host = options[:host] || 'www.yelloyello.com'
      @api_version = options[:version] || 'v1'
      # @username = options[:username]
      # @password = options[:password]
      @token = options[:token]
    end

  private
    def connection
      # More info: http://www.bjoernrochel.de/2013/02/09/oh-my-faraday/
      @connection ||= Faraday.new(url: api_url, headers: { accept: 'application/json' }) do |builder|
        # builder.basic_auth @username, @password
        builder.token_auth @token
        # builder.request :basic_auth, username, password

        builder.request   :json
        # builder.request   :basic_auth, options[:user], options[:password]
        builder.request   :retry

        builder.response  :mashify # Order seems important here :S
        builder.response  :json, :content_type => /\b(json|json-home)$/
        builder.adapter   Faraday.default_adapter # Should be last
      end
    end

    def api_url
      "http://#{api_host}/api/#{api_version}"
    end

  end # /Client

end
