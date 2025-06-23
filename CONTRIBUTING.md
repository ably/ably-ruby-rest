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