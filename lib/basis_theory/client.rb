# frozen_string_literal: true

require 'logger'

module BasisTheory
  class Client
    BASE_URL = 'https://api.basistheory.com/'

    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
    end

    def application
      ApplicationResource.new(self)
    end

    def atomic_bank
      AtomicBankResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        # conn.response :logger, ::Logger.new(STDOUT), body: true, bodies: { request: true, response: true }
        conn.headers['X-API-KEY'] = api_key
        conn.headers['Content-Type'] = 'application/json'

        conn.response :json, content_type: 'application/json'

        conn.adapter adapter
      end
    end
  end
end
