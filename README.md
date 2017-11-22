# Rapa

[![CircleCI](https://img.shields.io/circleci/project/github/r7kamura/rapa.svg)](https://circleci.com/gh/r7kamura/rapa)
[![Gem Version](https://badge.fury.io/rb/rapa.svg)](https://rubygems.org/gems/rapa)
[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/github/r7kamura/rapa)

An API client library for Amazon Product Advertising API, written in Ruby.

See the official documents for more details about Amazon Product Advertising API.

- http://docs.aws.amazon.com/AWSECommerceService/latest/DG/Welcome.html
- https://affiliate-program.amazon.com/gp/advertising/api/detail/main.html

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

- `:id_type`
- `:item_ids`
- `:domain`
- `:related_item_page`
- `:relationship_type`
- `:response_groups`
- `:search_index`

Returns a `Rapa::Responses::ListItemsResponse`.

```ruby
response = client.list_items(
  item_ids: ["..."],
  domain: "...",
  response_groups: ["..."],
)
```

### Rapa::Client#lookup_browse_node

Available options:

- `:browse_node_id`
- `:domain`
- `:response_groups`

Returns a `Rapa::Responses::LookupBrowseNodeResponse`.

```ruby
response = client.lookup_browse_node(
  browse_node_id: "...",
  domain: "...",
  response_groups: ["..."],
)
```

### Rapa::Client#search_items

Available options:

- `:browse_node_id`
- `:domain`
- `:item_page`
- `:keywords`
- `:power`
- `:related_item_page`
- `:relationship_type`
- `:response_groups`
- `:search_index`

Returns a `Rapa::Responses::SearchItemsResponse`.

```ruby
response = client.search_items(
  domain: "...",
  keywords: ["..."],
  response_groups: ["..."],
)
```

### Rapa::Responses::LookupBrowseNodeResponse

Available methods:

- `#error`
- `#has_error?`
- `#has_valid_request?`
- `#response_group(group)`

### Rapa::Responses::SearchItemsResponse

Available methods:

- `#error`
- `#has_error?`
- `#has_valid_request?`
- `#total_pages`
- `#total_results`

### Rapa::Resources::BrowseNodeResource

Available methods:

- `#asin`
- `#author`
- `#eook?`
- `#product_group`
- `#title`
- `#url_details_page`

### Rapa::Resources::ItemResource

Available methods:

- `#adult_product?`
- `#alternate_versions`
- `#asin`
- `#authors`
- `#binding`
- `#browse_nodes`
- `#creators`
- `#creator_name`
- `#creator_role`
- `#ean`
- `#ebook?`
- `#episode_sequence`
- `#genre`
- `#has_customer_reviews?`
- `#image_hi_res`
- `#image_large`
- `#image_medium`
- `#image_small`
- `#image_swatch`
- `#image_thumbnail`
- `#image_tiny`
- `#isbn`
- `#item_height`
- `#item_length`
- `#item_width`
- `#label`
- `#languages`
- `#manufacturer`
- `#number_of_pages`
- `#package_height`
- `#package_length`
- `#package_weight`
- `#package_width`
- `#price_lowest_collectible`
- `#price_lowest_new`
- `#price_lowest_used`
- `#product_group`
- `#product_type_name`
- `#publication_date`
- `#publisher`
- `#related_item_count`
- `#related_item_page`
- `#related_item_page_count`
- `#related_items`
- `#relationship`
- `#relationship_type`
- `#release_date`
- `#running_time`
- `#sales_rank`
- `#season_sequence`
- `#similar_products`
- `#studio`
- `#title`
- `#url_add_to_wishlist`
- `#url_all_customer_reviews`
- `#url_all_offers`
- `#url_customer_reviews_iframe`
- `#url_details_page`
- `#url_tell_a_friend`

## Hints

### Domain

Available `:domain` option examples:

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

### IdType

Available `:id_type` option examples:

- `"ASIN"`
- `"EAN"`
- `"ISBN"`
- `"JAN"`
- `"SKU"`
- `"UPC"`

### SearchIndex

Available `:search_index` option examples:

- `"All"`
- `"Apparel"`
- `"Appliances"`
- `"Automotive"`
- `"Baby"`
- `"Beauty"`
- `"Blended"`
- `"Books"`
- `"Classical"`
- `"CreditCards"`
- `"DVD"`
- `"Electronics"`
- `"ForeignBooks"`
- `"GiftCards"`
- `"Grocery"`
- `"HealthPersonalCare"`
- `"Hobbies"`
- `"HomeImprovement"`
- `"Industrial"`
- `"Jewelry"`
- `"KindleStore"`
- `"Kitchen"`
- `"Marketplace"`
- `"MP3Downloads"`
- `"Music"`
- `"MusicalInstruments"`
- `"OfficeProducts"`
- `"PCHardware"`
- `"PetSupplies"`
- `"Shoes"`
- `"Software"`
- `"SportingGoods"`
- `"Toys"`
- `"Video"`
- `"VideoDownload"`
- `"VideoGames"`
- `"Watches"`

See http://docs.aws.amazon.com/AWSECommerceService/latest/DG/localevalues.html for more details.
