# SetOfRanges [![Build Status](https://secure.travis-ci.org/palmergs/set_of_ranges.png?branch=master)](http://travis-ci.org/palmergs/set_of_ranges)

`SetOfRanges::Set` is a simple gem that inherits from `Set` and allows `Range` instances as values. It behaves like `Set` except that the add method attempts to merge adjacent and overlapping ranges. It was designed for use with integer values. Insertion of new range values is proportional to the number of existing values in the set.

## Installation

Add this line to your application's Gemfile:

    gem 'set_of_ranges'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install set_of_ranges

## Usage

    require 'set_of_ranges'

    set = SetOfRanges::Set.new
    set << (5..10)
    set << (15..20)
    set.to_a #=>  [5..10, 15..20]
    
    set << (2..6)
    set.to_a #=>  [2..10, 15..20]

    set << (3..9)
    set.to_a #=>  [2..10, 15..20]

    set << (11...12)
    set.to_a #=>  [2..11, 15..20]

    set << (12..14)
    set.to_a #=>  [2..20]




## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
