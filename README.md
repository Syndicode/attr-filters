# AttrFilters

[![Build Status](https://travis-ci.com/Syndicode/attr-filters.svg?branch=master)](https://travis-ci.com/Syndicode/attr-filters)

Light weight gem for filtering PORO attributes with zero dependencies.

## Description

AttrFilters brings simple DSL for adding filters to your PORO attributes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'attr_filters'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install attr_filters

## Usage

You can add filters like that:

```ruby
class SingupForm
  include AttrFilters

  attr_accessor :email, :first_name, :last_name, :zip

  filters :email, trim: true, downcase: true
  filters :first_name, :last_name, trim: true, letters_only: true
  filters :zip, trim: true, numbers_only: true
end
```

And call `#filter!` method to apply filters for attributes values


```ruby
form = SingupForm.new

form.email      = "  mike.dou@example.com "
form.first_name = "Mike 123"
form.last_name  = " Dou"
form.zip        = "abc12345"

form.filter!

form.email        # => "mike.dou@example.com"
form.first_name   # => "Mike"
form.last_name    # => "Dou"
form.zip          # => "12345"
```

## Available Filters

 - `trim` - removes leading and trailing whitespaces
 - `downcase` - replaces all upcase letters to lowercase ones
 - `upcase` - replaces all lowercase letters to upcase ones
 - `capitalize` - upcases first letter and lowercase others
 - `squeeze` - removes duplicating whitespaces
 - `numbers_only` - removes non digits characters
 - `letters_only` - removes non letter characters


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/attr_filters. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AttrFilters project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/attr_filters/blob/master/CODE_OF_CONDUCT.md).
