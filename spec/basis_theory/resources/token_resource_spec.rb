# frozen_string_literal: true

RSpec.describe BasisTheory::TokenResource do
  before do
    @client = BasisTheory::Client.new(api_key: ENV['API_KEY'])
  end

  describe '#list' do
    it 'returns a collection of Tokens' do
      VCR.use_cassette('token_list') do
        tokens = @client.tokens.list

        expect(tokens.class).to eq(BasisTheory::Collection)
        expect(tokens.data.first.class).to eq(BasisTheory::Token)
      end
    end
  end

  describe '#list_decrypted' do
    it 'returns a collection of Tokens' do
      VCR.use_cassette('token_list_decrypted') do
        tokens = @client.tokens.list_decrypted

        expect(tokens.class).to eq(BasisTheory::Collection)
        expect(tokens.data.first.class).to eq(BasisTheory::Token)
        expect(tokens.data.first.data).to eq('some_data_to_encrypt')
      end
    end
  end

  describe '#create' do
    it 'returns a Token object' do
      VCR.use_cassette('token_create') do
        token = @client.tokens.create(data: 'some_data_to_encrypt')

        expect(token.class).to eq(BasisTheory::Token)
        expect(token.type).to eq('token')
        p token
      end
    end
  end

  describe '#find' do
    it 'returns an Token object' do
      VCR.use_cassette('token_find') do
        created_token = create_token

        found_token = @client.tokens.find(created_token.id)

        expect(found_token.id).to eq(created_token.id)
      end
    end
  end

  describe '#decrypt' do
    it 'returns an Token object' do
      VCR.use_cassette('token_decrypt') do
        created_token = create_token

        token = @client.tokens.decrypt(created_token.id)

        expect(token.class).to eq(BasisTheory::Token)
      end
    end

    it 'returns decypted data' do
      VCR.use_cassette('token_decrypt') do
        created_token = create_token

        found_token = @client.tokens.decrypt(created_token.id)

        expect(found_token.data).to eq('some_data_to_encrypt')
      end
    end
  end

  describe '#delete' do
    it 'returns a 204 status' do
      VCR.use_cassette('token_delete') do
        created_token = create_token

        response = @client.tokens.delete(created_token.id)

        expect(response.status).to eq(204)
      end
    end
  end

  def create_token
    @client.tokens.create(data: 'some_data_to_encrypt')
  end
end
