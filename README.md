# Refile::Gridfs

A Gridfs backend for [Refile](https://github.com/elabs/refile).

[![Build Status](https://travis-ci.org/Titinux/refile-gridfs.svg)](https://travis-ci.org/Titinux/refile-gridfs)
[![Code Climate](https://codeclimate.com/github/Titinux/refile-gridfs/badges/gpa.svg)](https://codeclimate.com/github/Titinux/refile-gridfs)

## Why?

* You want to store all your data in one place to simplify backups and replication

## Take into account

* Gem is developed and tested using Mongodb 3.0, Ruby 2.2 and Mongo 2.1. It might work with earlier versions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'refile-gridfs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install refile-gridfs

## Usage with Rails

Generate initializer and set Refile::Gridfs as `store` backend.

    $ rails g refile:gridfs:initializer

## Thanks

This code was greatly inspired from the [refile-postgres](https://github.com/krists/refile-postgres) project.

## Contributing

1. Fork it ( https://github.com/Titinux/refile-gridfs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
