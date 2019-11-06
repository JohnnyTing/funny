# Funny

Funny is a gem that create a Microsoft Word document(.docx), and the word_document includes tables's metadata,
like field name、field type、field comments etc.

![word_document](https://dingxu66.oss-cn-beijing.aliyuncs.com/img/20191102144020.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'funny', github: 'JohnnyTing/funny'
```
And then execute:

    $ bundle

## Usage

Just execute this command

    $ funny generate

By default, it is connects to the database in your development environment, if you want to do that in production environment,
you can execute below this command:

    $ funny generate --environment production

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JohnnyTing/funny. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Funny project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/JohnnyTing/funny/blob/master/CODE_OF_CONDUCT.md).
