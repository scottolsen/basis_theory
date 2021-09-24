# frozen_string_literal: true

module BasisTheory
  class ApplicationResource < Resource
    def list(**params)
      response = get_request('applications', params: params)
      Collection.from_response(response, type: Application)
    end

    def create(**attributes)
      Application.new(post_request('applications', body: attributes).body)
    end
  end
end
