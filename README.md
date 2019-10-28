# AttrFilters

[![Build Status](https://travis-ci.com/Syndicode/attr-filters.svg?branch=master)](https://travis-ci.com/Syndicode/attr-filters)
[![Gem Version](https://badge.fury.io/rb/attr_filters.svg)](https://badge.fury.io/rb/attr_filters)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FSyndicode%2Fattr-filters.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2FSyndicode%2Fattr-filters?ref=badge_shield)

Light weight gem for filtering PORO (Plain Old Ruby Objects) attributes with zero dependencies.

## Description

AttrFilters brings simple DSL for adding filters to your PORO attributes.<br>
Easy to integrate with Rails validation.

## Requirements
  - Ruby >= 2.4

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

And call `#filter!` method to apply filters to attributes values


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

## Integration with Rails
### Requirements
  - ActiveModel >= 4.2.0

For Rails integration you should include `AttrFilters::ActiveModel`.<br>
After that you can add filters using `validates` method.

```ruby
class SingupForm
  include ActiveModel::Model
  include AttrFilters::ActiveModel

  attr_accessor :user_name

  validates :user_name, presence: true, filters: { trim: true, squeeze: true }
end

form = SingupForm.new(user_name: "  Mike   Dou  ")
form.filter!
form.user_name  # => "Mike Dou"
```

Also filters can be run automatically before validation. Require `ActiveModel::Validations::Callbacks`

```ruby
class SingupForm
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks
  include AttrFilters::ActiveModel

  attr_accessor :user_name, :zip

  validates :user_name, presence: true, filters: { trim: true, squeeze: true }
  filters :zip, trim: true, numbers_only: true
end

form = SingupForm.new(user_name: "  Mike   Dou  ", zip: "12345abc")
form.valid?
form.user_name  # => "Mike Dou"
form.zip        # => "12345"
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

Bug reports and pull requests are welcome on GitHub at https://github.com/Syndicode/attr_filters. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AttrFilters project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Syndicode/attr_filters/blob/master/CODE_OF_CONDUCT.md).

## Authors

[Syndicode.com](https://syndicode.com)
