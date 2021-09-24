# frozen_string_literal: true

require 'json'

module BasisTheory
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def get_request(url, params: {}, headers: {})
      handle_response client.connection.get(url, params, headers)
    end

    def post_request(url, body:, headers: {})
      handle_response client.connection.post(url, body.to_json, headers)
    end

    def patch_request(url, body:, headers: {})
      handle_response client.connection.patch(url, body, headers)
    end

    def put_request(url, body:, headers: {})
      handle_response client.connection.put(url, body, headers)
    end

    def delete_request(url, params: {}, headers: {})
      handle_response client.connection.delete(url, params, headers)
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/MethodLength
    def handle_response(response)
      case response.status
      when 400
        raise Error, "Invalid request body. #{response.body['error']}"
      when 401
        raise Error, "A missing or invalid X-API-KEY was provided. #{response.body['error']}"
      when 403
        raise Error, "The provided X-API-KEY does not have the required permissions. #{response.body['error']}"
      when 404
        raise Error, "Request entity was not found. #{response.body['error']}"
      when 422
        raise Error, "Request does not satisfy requirements for processing. #{response.body['error']}"
      when 429
        raise Error, "Request has been rate limited. #{response.body['error']}"
      when 500
        raise Error, "Something went wrong on Basis Theory's side. #{response.body['error']}"
      end

      response
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/MethodLength
  end
end
