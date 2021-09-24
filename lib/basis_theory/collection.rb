# frozen_string_literal: true

module BasisTheory
  class Collection
    attr_reader :data, :total_items, :page_number, :page_size, :total_pages

    def self.from_response(response, type:)
      body = response.body
      new(
        data: body['data'].map { |attrs| type.new(attrs) },
        total_items: body.dig('pagination', 'total_items'),
        page_number: body.dig('pagination', 'page_number'),
        page_size: body.dig('pagination', 'page_size'),
        total_pages: body.dig('pagination', 'total_pages')
      )
    end

    def initialize(data:, total_items:, page_number:, page_size:, total_pages:)
      @data = data
      @total_items = total_items
      @page_number = page_number
      @page_size = page_size
      @total_pages = total_pages
    end
  end
end
