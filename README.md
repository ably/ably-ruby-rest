# [Ably](https://www.ably.io)

[![Gem Version](https://badge.fury.io/rb/ably-rest.svg)](http://badge.fury.io/rb/ably-rest)
[![Coverage Status](https://coveralls.io/repos/github/ably/ably-ruby-rest/badge.svg?branch=main)](https://coveralls.io/github/ably/ably-ruby-rest?branch=main)

_[Ably](https://ably.com) is the platform that powers synchronized digital experiences in realtime. Whether attending an event in a virtual venue, receiving realtime financial information, or monitoring live car performance data – consumers simply expect realtime digital experiences as standard. Ably provides a suite of APIs to build, extend, and deliver powerful digital experiences in realtime for more than 250 million devices across 80 countries each month. Organizations like Bloomberg, HubSpot, Verizon, and Hopin depend on Ably’s platform to offload the growing complexity of business-critical realtime data synchronization at global scale. For more information, see the [Ably documentation](https://ably.com/documentation)._

This is a Ruby REST client library for Ably. The library currently targets the [Ably 1.1 client library specification](https://www.ably.io/documentation/client-lib-development-guide/features/). You can jump to the '[Known Limitations](#known-limitations)' section to see the features this client library does not yet support or [view our client library SDKs feature support matrix](https://www.ably.io/download/sdk-feature-support-matrix) to see the list of all the available features.

## Documentation

Visit https://www.ably.io/documentation for a complete API reference and more examples. The examples and API below is not exhaustive, you should use the completely [Ably API documentation](https://www.ably.io/documentation).

## Realtime vs REST

This REST only library was created for developers who do not want EventMachine as a dependency of their application. Typically developers who are using Ably within their Rails or Sinatra apps would prefer to use the REST library as it has less dependencies and offers a synchronous API.

If however you need to use a realtime library that offers an asynchronous evented AP, then we recommended you [take a look at the combined REST & Realtime gem](https://rubygems.org/gems/ably).

## Known Limitations

This client library is currently *not compatible* with some of the Ably features:

| Feature |
| :--- |
| [Custom transportParams](https://www.ably.io/documentation/realtime/connection#client-options) |

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
client = Ably::Rest.new(key: 'xxxxx')
channel = client.channel('test')
```

### Publishing a message to a channel

```ruby
channel.publish('myEvent', 'Hello!') #=> true
```

### Querying the History

```ruby
messages_page = channel.history #=> #<Ably::Models::PaginatedResult ...>
messages_page.items.first #=> #<Ably::Models::Message ...>
messages_page.items.first.data # payload for the message
messages_page.next # retrieves the next page => #<Ably::Models::PaginatedResult ...>
messages_page.has_next? # false, there are more pages
```

### Current presence members on a channel

```ruby
members_page = channel.presence.get # => #<Ably::Models::PaginatedResult ...>
members_page.items.first # first member present in this page => #<Ably::Models::PresenceMessage ...>
members_page.items.first.client_id # client ID of first member present
members_page.next # retrieves the next page => #<Ably::Models::PaginatedResult ...>
members_page.has_next? # false, there are more pages
```

### Querying the presence history

```ruby
presence_page = channel.presence.history #=> #<Ably::Models::PaginatedResult ...>
presence_page.items.first #=> #<Ably::Models::PresenceMessage ...>
presence_page.items.first.client_id # client ID of first member
presence_page.next # retrieves the next page => #<Ably::Models::PaginatedResult ...>
```

### Symmetric end-to-end encrypted payloads on a channel

When a 128 bit or 256 bit key is provided to the library, all payloads are encrypted and decrypted automatically using that key on the channel. The secret key is never transmitted to Ably and thus it is the developer's responsibility to distribute a secret key to both publishers and subscribers.

```ruby
secret_key = Ably::Util::Crypto.generate_random_key
channel = client.channels.get('test', cipher: { key: secret_key })
channel.publish nil, "sensitive data" # data will be encrypted before publish
messages_page = channel.history
messages_page.items.first.data #=> "sensitive data"
```

### Generate a Token

Tokens are issued by Ably and are readily usable by any client to connect to Ably:

```ruby
token_details = client.auth.request_token
# => #<Ably::Models::TokenDetails ...>
token_details.token # => "xVLyHw.CLchevH3hF....MDh9ZC_Q"
client = Ably::Rest.new(token: token_details)
```

### Generate a TokenRequest

Token requests are issued by your servers and signed using your private API key. This is the preferred method of authentication as no secrets are ever shared, and the token request can be issued to trusted clients without communicating with Ably.

```ruby
token_request = client.auth.create_token_request(ttl: 3600, client_id: 'jim')
# => {"id"=>...,
#     "clientId"=>"jim",
#     "ttl"=>3600,
#     "timestamp"=>...,
#     "capability"=>"{\"*\":[\"*\"]}",
#     "nonce"=>...,
#     "mac"=>...}

client = Ably::Rest.new(token: token_request)
```

### Fetching your application's stats

```ruby
stats_page = client.stats #=> #<Ably::Models::PaginatedResult ...>
stats_page.items.first = #<Ably::Models::Stats ...>
stats_page.next # retrieves the next page => #<Ably::Models::PaginatedResult ...>
```

### Fetching the Ably service time

```ruby
client.time #=> 2013-12-12 14:23:34 +0000
```

## Support, feedback and troubleshooting

Please visit http://support.ably.io/ for access to our knowledgebase and to ask for any assistance.

You can also view the [community reported Github issues](https://github.com/ably/ably-ruby-rest/issues).

To see what has changed in recent versions of Bundler, see the [CHANGELOG](CHANGELOG.md).

## Contributing

Please note that the bulk of this repo is in fact a submodule of the [Ably Ruby REST & Realtime library](https://github.com/ably/ably-ruby). If you want to issue a PR, it is likely you should be looking in that repo to add features or make contributions.

1. Fork it
2. When pulling to local, make sure to also pull submodules (git submodule init && git submodule update)
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Ensure you have added suitable tests and the test suite is passing(`bundle exec rspec`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new Pull Request

## Release Process

1. From the `main` branch, `cd lib/submodules/ably-ruby`
2. `git fetch origin && git fetch --tags`
3. Reset to the tagged version released in ably-ruby, e.g. `git reset v1.0.5 --hard`
4. Ensure submodules of this submodule are up to date (`git submodule update`)
5. cd to `ably-ruby-rest`
6. Stage changes `git add .`
7. Commit version upgrade (`git commit -m "Version upgrade to v1.0.5"`)
8. Run `rake release`

See the [Ably Ruby release process notes](https://github.com/ably/ably-ruby#release-process).

## License

Copyright (c) 2017 Ably Real-time Ltd, Licensed under the Apache License, Version 2.0.  Refer to [LICENSE](LICENSE) for the license terms.
