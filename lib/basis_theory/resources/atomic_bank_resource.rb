# frozen_string_literal: true

module BasisTheory
  class AtomicBankResource < Resource
    def list(**params)
      response = get_request('atomic/banks', params: params)
      Collection.from_response(response, type: AtomicBank)
    end

    def create(**attributes)
      AtomicBank.new(post_request('atomic/banks', body: attributes).body)
    end
  end
end
