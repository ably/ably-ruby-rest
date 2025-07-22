![Ably Chat Header](/images/ruby-REST-SDK-github.png)
[![Gem Version](https://badge.fury.io/rb/ably-rest.svg)](https://rubygems.org/gems/ably-rest)
[![License](https://badgen.net/github/license/ably/ably-ruby)](https://github.com/ably/ably-ruby/blob/main/LICENSE)

---

# Ably Pub/Sub Ruby REST SDK

Build using Ably’s Pub/Sub Ruby REST SDK, supported on all popular platforms and frameworks.

Ably Pub/Sub provides flexible APIs that deliver features such as pub-sub messaging, message history, presence, and push notifications. Utilizing Ably’s realtime messaging platform, applications benefit from its highly performant, reliable, and scalable infrastructure.

This REST-only SDK supports applications that do not to include `EventMachine` as a dependency. It's suitable for Rails or Sinatra applications, that favor the REST library due to its minimal dependencies and synchronous API.

For applications requiring Realtime functionality with an asynchronous, event-driven API, we recommend using the [combined REST & Realtime gem](https://rubygems.org/gems/ably).

Find out more:

* [Ably Pub/Sub docs.](https://ably.com/docs/basics)
* [Ably Pub/Sub examples.](https://ably.com/examples?product=pubsub)

---

## Getting started

Everything you need to get started with Ably:

* [Quickstart in Pub/Sub using Ruby](https://ably.com/docs/getting-started/quickstart?lang=ruby)
* [SDK Setup for Ruby.](https://ably.com/docs/getting-started/setup?lang=ruby)

---

## Supported platforms

Ably aims to support a wide range of platforms and browsers. If you experience any compatibility issues, open an issue in the repository or contact [Ably support](https://ably.com/support).

| Platform | Support |
|----------|---------|
| Ruby | >= 2.7 |

> [!IMPORTANT]
> SDK versions < 1.2.5 will be [deprecated](https://ably.com/docs/platform/deprecate/protocol-v1) from November 1, 2025.

---

## Installation

The client library is available as a [gem from RubyGems.org](https://rubygems.org/gems/ably-rest).

Add this line to your application's Gemfile:

```bash
gem 'ably-rest'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install ably-rest
```

---

## Usage

The following code connects to Ably's REST messaging service, publishes a messages to channel, retrieve message history, generate authentication tokens, and sends end-to-end encrypted messages:

```ruby
# Initialize client and channel
client = Ably::Rest.new(key: 'your-ably-api-key')
channel = client.channel('test-channel')

# Publishing a message to a channel
channel.publish('test-event', 'hello world!') #=> true

# Querying the History
messages_page = channel.history #=> #<Ably::Models::PaginatedResult ...>
messages_page.items.first.data # payload for the message

# Generate a Token (for secure client connections)
token_details = client.auth.request_token
token_details.token # => "your-token"
client = Ably::Rest.new(token: token_details)

# Encrypted messages
secret_key = Ably::Util::Crypto.generate_random_key
channel = client.channels.get('test-channel', cipher: { key: secret_key })
channel.publish nil, "sensitive data" # automatically encrypted
```

## Releases

The [CHANGELOG.md](./CHANGELOG.md) contains details of the latest releases for this SDK. You can also view all Ably releases on [changelog.ably.com](https://changelog.ably.com).

---

## Contribute

Read the [CONTRIBUTING.md](./CONTRIBUTING.md) guidelines to contribute to Ably.

---

## Support, feedback and troubleshooting

For help or technical support, visit Ably's [support page](https://ably.com/support). You can also view the [community reported Github issues](https://github.com/ably/ably-ruby-rest/issues) or raise one yourself.

### Custom transportParams

This client library is currently not compatible with [Custom transportParams](https://www.ably.io/documentation/realtime/connection#client-options)
