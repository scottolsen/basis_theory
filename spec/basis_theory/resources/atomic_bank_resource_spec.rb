# frozen_string_literal: true

RSpec.describe BasisTheory::AtomicBankResource do
  before do
    @client = BasisTheory::Client.new(api_key: ENV['API_KEY'])
  end

  describe '#list' do
    it 'returns a collection of AtomicBanks' do
      VCR.use_cassette('atomic_bank_list') do
        banks = @client.atomic_bank.list

        expect(banks.class).to eq(BasisTheory::Collection)
        expect(banks.data.first.class).to eq(BasisTheory::AtomicBank)
      end
    end
  end

  describe '#create' do
    it 'returns an AtomicBank object' do
      VCR.use_cassette('atomic_bank_create') do
        bank = create_bank

        expect(bank.class).to eq(BasisTheory::AtomicBank)
      end
    end
  end

  describe '#find' do
    it 'returns an AtomicBank object' do
      VCR.use_cassette('atomic_bank_find') do
        created_bank = create_bank

        found_bank = @client.atomic_bank.find(created_bank.id)

        expect(found_bank).to eq(created_bank)
      end
    end

    it 'returns encypted account_number' do
      VCR.use_cassette('atomic_bank_find') do
        created_bank = create_bank

        found_bank = @client.atomic_bank.find(created_bank.id)

        expect(found_bank.bank.account_number).to start_with('XXXXXX')
      end
    end
  end

  describe '#decrypt' do
    it 'returns an AtomicBank object' do
      VCR.use_cassette('atomic_bank_decrypt') do
        created_bank = create_bank

        bank = @client.atomic_bank.decrypt(created_bank.id)

        expect(bank.class).to eq(BasisTheory::AtomicBank)
      end
    end

    it 'returns decypted account_number' do
      VCR.use_cassette('atomic_bank_decrypt') do
        created_bank = create_bank

        found_bank = @client.atomic_bank.decrypt(created_bank.id)

        expect(found_bank.bank.account_number).to eq('1234567890')
      end
    end
  end

  describe '#delete' do
    it 'returns a 204 status' do
      VCR.use_cassette('atomic_bank_delete') do
        created_bank = create_bank

        response = @client.atomic_bank.delete(created_bank.id)

        expect(response.status).to eq(204)
      end
    end
  end

  def create_bank
    attributes = { routing_number: '021000021', account_number: '1234567890' }
    @client.atomic_bank.create(bank: attributes)
  end
end
