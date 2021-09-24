# frozen_string_literal: true

RSpec.describe BasisTheory::AtomicBankResource do
  describe 'list' do
    it 'returns a collection of AtomicBanks' do
      VCR.use_cassette('atom_bank_list') do
        client = BasisTheory::Client.new(api_key: ENV['API_KEY'])

        banks = client.atomic_bank.list

        expect(banks.class).to eq(BasisTheory::Collection)
      end
    end
  end

  describe 'create' do
    it 'returns an AtomicBank object' do
      VCR.use_cassette('atom_bank_create') do
        client = BasisTheory::Client.new(api_key: ENV['API_KEY'])

        attributes = { routing_number: '021000021', account_number: '1234567890' }
        bank = client.atomic_bank.create(bank: attributes)

        expect(bank.class).to eq(BasisTheory::AtomicBank)
      end
    end
  end
end
