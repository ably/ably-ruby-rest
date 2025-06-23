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

## Releases

The [CHANGELOG.md](/ably/ably-ruby-rest/blob/main/CHANGELOG.md) contains details of the latest releases for this SDK. You can also view all Ably releases on [changelog.ably.com](https://changelog.ably.com).

---

## Contribute

Read the [CONTRIBUTING.md](./CONTRIBUTING.md) guidelines to contribute to Ably.

---

## Known Limitations

This client library is currently *not compatible* with some of the Ably features:

| Feature |
| :--- |
| [Custom transportParams](https://www.ably.io/documentation/realtime/connection#client-options) |

## Support, feedback and troubleshooting

For help or technical support, visit Ably's [support page](https://ably.com/support). You can also view the [community reported Github issues](https://github.com/ably/ably-ruby-rest/issues) or raise one yourself.

## License

Copyright (c) 2017 Ably Real-time Ltd, Licensed under the Apache License, Version 2.0.  Refer to [LICENSE](LICENSE) for the license terms.
