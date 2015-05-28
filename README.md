# PDFMeta

PDFMeta is a gem designed to resiliantly return metadata from a PDF, using poppler/xpdf command line tools

## Installation

Install the poppler command line tools:

###OSX

`brew install poppler`

###Debian Based

`apt-get install poppler-utils`

Add this line to your application's Gemfile:

```ruby
gem 'pdf_meta'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pdf_meta

## Configuration

You shouldn't need to configure the gem, however if you've installed pdfinfo in a custom location then pass it here

```ruby
PDFMeta.configure do |config|
  config[:command_path] = '/path/to/pdfinfo' #=> Default is just 'pdfinfo' in path
end
```

## Usage

There's only one call to the API, it takes either a string path to a file, or an open file handle

```ruby
PDFMeta.read('path/to/file')

PDFMeta.read(File.open('path/to/file'))
```

It will return either a `PDFMeta::Results` or raise one of the following errors:
  - `PopplerMissingError`
  - `UnknownError`
  - `UnableToReadFileError`
  - `UnableOpenOutputFileError`
  - `PDFPermissionError`
  - `UnknownPopplerError`


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/boardiq/pdf_meta/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
