# Rapa

An API client library for Amazon Product Advertising API, written in Ruby.

See https://affiliate-program.amazon.com/gp/advertising/api/detail/main.html for more details about Amazon Product Advertising API.

## Requirements

- Ruby 2.2.2 or higher

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rapa"
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install rapa
```

## Usage

### Rapa::Client.new

Available options:

- `:access_key_id`
- `:associate_tag`
- `:secret_access_key`

Returns a `Rapa::Client`.

```ruby
require "rapa"
client = Rapa::Client.new(
  access_key_id: "...",
  associate_tag: "...",
  secret_access_key: "...",
)
```

### Rapa::Client#get_item

Available options:

- `:asin`
- `:domain`

Returns a `Rapa::Responses::GetItemResponse`.

```ruby
response = client.get_item_response(
  asin: "...",
  domain: "co.jp",
)
```
