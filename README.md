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

Please visit http://support.ably.io/ for access to our knowledgebase and to ask for any assistance.

You can also view the [community reported Github issues](https://github.com/ably/ably-ruby-rest/issues).

To see what has changed in recent versions of Bundler, see the [CHANGELOG](CHANGELOG.md).

## Contributing

Please note that the bulk of this repo is in fact a submodule of the [Ably Ruby REST & Realtime library](https://github.com/ably/ably-ruby). If you want to issue a PR, it is likely you should be looking in that repo to add features or make contributions.

The dependencies in [`ably-rest.gemspec`](./ably-rest.gemspec) must be manually kept in sync with those in [`lib/submodules/ably-ruby/ably.gemspec`](./lib/submodules/ably-ruby/ably.gemspec).

1. Fork it
2. When pulling to local, make sure to also pull submodules (git submodule init && git submodule update)
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Ensure you have added suitable tests and the test suite is passing(`bundle exec rspec`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new Pull Request

## Release Process

1. Create a branch for the release, named like `release/1.2.3` (where `1.2.3` is the new version number)
2. Change dir to `cd lib/submodules/ably-ruby` and `git fetch origin && git fetch --tags`
3. Reset to the tagged version released in ably-ruby, e.g. `git reset v1.2.3 --hard`
4. Ensure submodules of this submodule are up to date using `git submodule update`
5. Change dir back to root / `ably-ruby-rest`
6. Stage changes made at submodule file `git add lib/submodules/ably-ruby`
7. Bring dependency versions in [`ably-rest.gemspec`](./ably-rest.gemspec) in line with [`lib/submodules/ably-ruby/ably.gemspec`](./lib/submodules/ably-ruby/ably.gemspec)
8. Commit the change `git commit -m "Version upgrade to v1.2.3"` and push the changes.
9. Make a PR against `main`. Once the PR is approved, merge it into `main`
10. Add a tag to the new `main` head commit and push to origin such as `git tag v1.2.3 && git push origin v1.2.3`
11. Visit [https://github.com/ably/ably-ruby/tags](https://github.com/ably/ably-ruby/tags) and `Add release notes` for the release including links to the changelog entry. 
12. Run `rake release` to publish the gem to [Rubygems](https://rubygems.org/gems/ably-rest)

See the [Ably Ruby release process notes](https://github.com/ably/ably-ruby#release-process).

## License

Copyright (c) 2017 Ably Real-time Ltd, Licensed under the Apache License, Version 2.0.  Refer to [LICENSE](LICENSE) for the license terms.
