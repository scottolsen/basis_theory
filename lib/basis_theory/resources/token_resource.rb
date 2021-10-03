# frozen_string_literal: true

module BasisTheory
  class TokenResource < Resource
    def list(**params)
      response = get_request('tokens', params: params)
      Collection.from_response(response, type: Token)
    end

    def list_decrypted(**params)
      response = get_request('tokens/decrypt', params: params)
      Collection.from_response(response, type: Token)
    end

    def create(**attributes)
      Token.new(post_request('tokens', body: attributes).body)
    end

    def find(id)
      Token.new(get_request("tokens/#{id}").body)
    end

    def decrypt(id)
      Token.new(get_request("tokens/#{id}/decrypt").body)
    end

    def delete(id)
      delete_request("tokens/#{id}")
    end
  end
end
