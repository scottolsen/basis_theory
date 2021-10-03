# BasisTheory API Rubygem

[![Build Status](https://github.com/scottolsen/basis_theory/workflows/Tests/badge.svg)](https://github.com/scottolsen/basis_theory/actions)

Rubygem for [Basis Theory](https://basistheory.com/). API docs can be found [here.](https://docs.basistheory.com/api-reference/#introduction)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'basis_theory'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install basis_theory

## Usage

Grab an API Key from an Application you created.

```ruby
client = BasisTheory::Client.new(api_key: 'YOUR_API_KEY')
```

### Applications

#### List Applications

```ruby
applications = client.applications.list # => BasisTheory::Collection

application = applications.data.first # => BasisTheory::Application

application.type # => 'server_to_server'
```

#### Create an Application

```ruby
application = client.applications.create(name: 'My Example App', type: 'server_to_server')

application.type # => 'server_to_server'
```

### Tokens

#### List Tokens

```ruby
tokens = client.tokens.list # => BasisTheory::Collection

token = tokens.data.first # => BasisTheory::Token

token.type # => 'token'
token.data # => 'encrypted_data'
```

#### Create an Token

```ruby
token = client.tokens.create(data: 'some_data_to_encrypt')

token.type # => 'token'
```

#### Find Token

```ruby
token = client.tokens.find('your_token_id') # => BasisTheory::Collection

token.type # => 'token'
token.data # => 'your_encrypted_data'
```

#### Decrypt Token

```ruby
token = client.tokens.decrypt('your_token_id') # => BasisTheory::Collection

token.type # => 'token'
token.data # => 'your_decrypted_data'
```

#### Delete Token

```ruby
client.tokens.delete('your_token_id') # => BasisTheory::Collection
```
### Atomic Banks

#### List Atomic Banks

```ruby
atomic_banks = client.atomic_banks.list # => BasisTheory::Collection

atomic_bank = atomic_banks.data.first # => BasisTheory::AtomicBank

atomic_bank.type # => 'bank'
atomic_bank.bank.routing_number # => '021000021'
```

#### Create an Atomic Bank

```ruby
atomic_bank = client.atomic_banks.create(
  bank: {
    routing_number: '021000021',
    account_number: '1234567890'
  }
)

atomic_bank.type # => 'bank'
atomic_bank.bank.routing_number # => '021000021'
```

#### Find Atomic Bank

```ruby
atomic_bank = client.atomic_banks.find('your_atomic_bank_id') # => BasisTheory::Collection

atomic_bank.type # => 'bank'
atomic_bank.bank.routing_number # => '021000021'
atomic_bank.bank.account_number # => 'XXXXX67890'
```

#### Decrypt Atomic Bank

```ruby
atomic_bank = client.atomic_banks.decrypt('your_atomic_bank_id') # => BasisTheory::Collection

atomic_bank.type # => 'bank'
atomic_bank.bank.account_number # => '1234567890'
```

#### Delete Atomic Bank

```ruby
client.atomic_banks.delete('your_atomic_bank_id') # => BasisTheory::Collection
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/scottolsen/basis_theory.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
