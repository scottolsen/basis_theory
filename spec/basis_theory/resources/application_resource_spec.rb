# frozen_string_literal: true

RSpec.describe BasisTheory::AtomicBankResource do
  before do
    @client = BasisTheory::Client.new(api_key: ENV['MANAGEMENT_API_KEY'])
  end

  describe '#list' do
    it 'returns a collection of Application' do
      VCR.use_cassette('application_list') do
        app = @client.applications.list

        expect(app.class).to eq(BasisTheory::Collection)
        expect(app.data.first.class).to eq(BasisTheory::Application)
      end
    end
  end

  describe '#create' do
    it 'returns an Application object' do
      VCR.use_cassette('application_create') do
        app = @client.applications.create(name: 'RSpec Test', type: 'server_to_server')

        expect(app.class).to eq(BasisTheory::Application)
        expect(app.name).to eq('RSpec Test')
      end
    end
  end
end
