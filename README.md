# Warpera

![Gem](https://img.shields.io/gem/v/warpera?color=firebrick&style=flat-square)

A gem that makes working with years in different eras palatable

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'warpera'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install warpera

## Usage

Require the gem in your files with:

```ruby
require 'warpera'
```

When working directly with the numbers and strings, use the `conv_s` and
`conv_i` methods.

When needing control over the year and era, use the `Warpera::Pair` class. This
is helpful, for instance, dealing with storing a year in a database. Instead of
potentially storing two fields for one attribute, use this to store one field
for the one attribute.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to [rubygems.org][1].

[1]: rubygems.org/gems/warpera

## Contributing

Bug reports and pull requests are welcome on [the GitHub repo][2].

[2]: https://github.com/parmort/warpera

## License

The gem is available as open source under the terms of the [MIT License][3]

[3]: https://opensource.org/licenses/MIT.
