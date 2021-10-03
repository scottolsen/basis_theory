# frozen_string_literal: true

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<NO SOUP FOR YOU>') { ENV['API_KEY'] }
  c.filter_sensitive_data('<NO SOUP FOR YOU>') { ENV['MANAGEMENT_API_KEY'] }
  c.filter_sensitive_data('<NO SOUP FOR YOU>') { ENV['TENANT_ID'] }
end
