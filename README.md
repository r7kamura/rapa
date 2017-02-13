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

### Rapa::Client#list_items

Available options:

- `:asins`
- `:domain`
- `:response_groups`

Available domains:

- `"ca"`
- `"cn"`
- `"co.jp"`
- `"co.uk"`
- `"com"`
- `"com.br"`
- `"com.mx"`
- `"de"`
- `"es"`
- `"fr"`
- `"in"`
- `"it"`

Returns a `Rapa::Responses::ListItemsResponse`.

```ruby
response = client.list_items(
  asins: ["...", "..."],
  domain: "co.jp",
  response_groups: ["...", "..."],
)
```

### Rapa::Resources::ItemResource

Available methods:

- `#asin`
- `#authors`
- `#creator_name`
- `#creator_role`
- `#manufacturer`
- `#product_group`
- `#title`
- `#url_add_to_wishlist`
- `#url_all_customer_reviews`
- `#url_all_offers`
- `#url_details_page`
- `#url_tell_a_friend`
