## Unreleased

- Add some price method on `Rapa::Resources::ItemResource`

## v0.5.2

- Support YYYY-mm format on `#publication_date` and `#release_date`

## v0.5.1

- Fix `Rapa::Resources::ItemResource#alternate_versions` type
- Fix `Rapa::Resources::ItemResource#authors` type
- Fix `Rapa::Resources::ItemResource#browse_nodes` type
- Fix `Rapa::Resources::ItemResource#languages` type
- Fix `Rapa::Resources::ItemResource#related_items` type
- Fix `Rapa::Resources::ItemResource#similar_products` type

## v0.5.0

- Change `Rapa::Resources::ItemResource#browse_nodes` returned value type
- Add `Rapa::BrowseNode#ancestors`
- Add `Rapa::BrowseNode#self_or_ancestors`

## v0.4.3

- Add `Rapa::Resources::ItemResource#ebook?`

## v0.4.2

- Add `:browse_node_id` options to `Rapa::Client#search_items`
- Add `:item_page` option to `Rapa::Client#search_items`
- Add `:power` option to `Rapa::Client#search_items`
- Add `Rapa::Queries::BaseQuery#inspect`

## v0.4.1

- Fix signature escape bug

## v0.4.0

- Add `:item_ids` option to `Rapa::Client#list_items`
- Add `:item_type` option to `Rapa::Client#list_items`
- Remove `:asins` option from `Rapa::Client#list_items`

## v0.3.3

- Fix bug on no image set case

## v0.3.2

- Fix bug on multi image sets item

## v0.3.1

- Fix escape bug of spaces in URL query

## v0.3.0

- Add `Rapa::Responses::SearchItemsResponse#error`
- Add `Rapa::Responses::SearchItemsResponse#has_error?`
- Add `Rapa::Responses::SearchItemsResponse#has_valid_request?`
- Use `"All"` as default SearchIndex parameter
- Fix bug that no files included in gem package

## v0.2.1

- Add `Rapa::Responses::SearchItemsResponse#total_pages`
- Add `Rapa::Responses::SearchItemsResponse#total_results`
- Fix response parser on `Rapa::Client#search_items`

## v0.2.0

- Add `Rapa::Client#search_items`

## v0.1.0

- Add `Rapa::Resources::ItemResource`
- Change required Ruby version from 2.2.2 to 2.3

## v0.0.1

- 1st Release :tada:
- Add `Rapa::Client#list_items`
