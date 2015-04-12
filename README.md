# [Ably](https://ably.io)

[![Build Status](https://travis-ci.org/ably/ably-ruby-rest.png)](https://travis-ci.org/ably/ably-ruby-rest)
[![Gem Version](https://badge.fury.io/rb/ably-rest.svg)](http://badge.fury.io/rb/ably-rest)


A Ruby REST client library for [ably.io](https://ably.io), the real-time messaging service.

Note: This library was created solely for developers who do not want EventMachine as a dependency of their application.  If this is not a requirement for you, then we recommended you use the combined [REST & Real-time gem](https://rubygems.org/gems/ably).

## Installation

The client library is available as a [gem from RubyGems.org](https://rubygems.org/gems/ably-rest).

Add this line to your application's Gemfile:

    gem 'ably-rest'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ably-rest

## Using the REST API

All examples assume a client and/or channel has been created as follows:

```ruby
client = Ably::Rest.new(api_key: 'xxxxx')
channel = client.channel('test')
```

### Publishing a message to a channel

```ruby
channel.publish('myEvent', 'Hello!') #=> true
```

### Querying the History

```ruby
mesage_history = channel.history #=> #<Ably::Models::PaginatedResource ...>
message_history.first # => #<Ably::Models::Message ...>
```

### Presence on a channel

```ruby
members = channel.presence.get # => #<Ably::Models::PaginatedResource ...>
members.first # => #<Ably::Models::PresenceMessage ...>
```

### Querying the Presence History

```ruby
presence_history = channel.presence.history # => #<Ably::Models::PaginatedResource ...>
presence_history.first # => #<Ably::Models::PresenceMessage ...>
```

### Generate Token and Token Request

```ruby
client.auth.request_token
# => #<Ably::Models::Token ...>

token = client.auth.create_token_request
# => {"id"=>...,
#     "clientId"=>nil,
#     "ttl"=>3600,
#     "timestamp"=>...,
#     "capability"=>"{\"*\":[\"*\"]}",
#     "nonce"=>...,
#     "mac"=>...}

client = Ably::Rest.new(token_id: token.id)
```

### Fetching your application's stats

```ruby
stats = client.stats #=> #<Ably::Models::PaginatedResource ...>
stats.first = #<Ably::Models::Stat ...>
```

### Fetching the Ably service time

```ruby
client.time #=> 2013-12-12 14:23:34 +0000
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
