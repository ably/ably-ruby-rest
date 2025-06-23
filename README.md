# [Ably](https://www.ably.io)

[![Gem Version](https://badge.fury.io/rb/ably-rest.svg)](https://rubygems.org/gems/ably-rest)
[![License](https://badgen.net/github/license/ably/ably-ruby)](https://github.com/ably/ably-ruby/blob/main/LICENSE)

---

# Ably Pub/Sub Ruby REST SDK

Build any realtime experience using Ably’s Pub/Sub Ruby REST SDK, supported on all popular platforms and frameworks.

Ably Pub/Sub provides flexible APIs that deliver features such as pub-sub messaging, message history, presence, and push notifications. Utilizing Ably’s realtime messaging platform, applications benefit from its highly performant, reliable, and scalable infrastructure.

Find out more:

* [Ably Pub/Sub docs.](https://ably.com/docs/basics)
* [Ably Pub/Sub examples.](https://ably.com/examples?product=pubsub)

---

## Getting started

Everything you need to get started with Ably:

- [Quickstart in Pub/Sub using Ruby](https://ably.com/docs/getting-started/quickstart?lang=ruby)

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

## Realtime vs REST

This REST only library was created for developers who do not want EventMachine as a dependency of their application. Typically developers who are using Ably within their Rails or Sinatra apps would prefer to use the REST library as it has less dependencies and offers a synchronous API.

If however you need to use a realtime library that offers an asynchronous evented AP, then we recommended you [take a look at the combined REST & Realtime gem](https://rubygems.org/gems/ably).

## Known Limitations

This client library is currently *not compatible* with some of the Ably features:

| Feature |
| :--- |
| [Custom transportParams](https://www.ably.io/documentation/realtime/connection#client-options) |

## Support, feedback and troubleshooting

For help or technical support, visit Ably's [support page](https://ably.com/support). You can also view the [community reported Github issues](https://github.com/ably/ably-ruby-rest/issues) or raise one yourself.

## License

Copyright (c) 2017 Ably Real-time Ltd, Licensed under the Apache License, Version 2.0.  Refer to [LICENSE](LICENSE) for the license terms.
