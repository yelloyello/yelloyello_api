# YelloyelloApi

This package is in beta and for private use only. Everything might change :)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yelloyello_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yelloyello_api

## Usage

    client = YelloyelloApi::Client.new(username, password)
    results = client.get('places/search.json', search: {q: 'restaurant'})
    results.body.places.first.name # => "Some name"

    new_place = client.post('places.json', place: {name: 'Restaurant Q'})

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/yelloyello_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
