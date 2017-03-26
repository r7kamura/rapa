require "faraday"
require "faraday_middleware"
require "uri"

module Rapa
  class Client
    # @param access_key_id [String]
    # @param associate_tag [String]
    # @param secret_access_key [String]
    def initialize(access_key_id:, associate_tag:, secret_access_key:)
      @access_key_id = access_key_id
      @associate_tag = associate_tag
      @secret_access_key = secret_access_key
    end

    # @return [Faraday::Connection]
    def connection
      @connection ||= ::Faraday::Connection.new do |connection|
        connection.adapter :net_http
        connection.response :xml
        connection.options.params_encoder = ::Rapa::Encoder.new
      end
    end

    # @param item_ids [Array<String>]
    # @param domain [String]
    # @param id_type [String, nil]
    # @param related_item_page [Integer, nil]
    # @param relationship_type [String, nil]
    # @param response_groups [Array<String>, nil]
    # @return [Rapa::Responses::ListItemsResponse]
    def list_items(
      item_ids:,
      domain:,
      id_type: nil,
      related_item_page: nil,
      relationship_type: nil,
      response_groups: nil,
      search_index: nil
    )
      send_request(
        item_ids: item_ids,
        domain: domain,
        id_type: id_type,
        query_class: ::Rapa::Queries::ListItemsQuery,
        related_item_page: related_item_page,
        relationship_type: relationship_type,
        response_class: ::Rapa::Responses::ListItemsResponse,
        response_groups: response_groups,
        search_index: search_index
      )
    end

    # @param domain [String]
    # @param item_page [Integer, nil]
    # @param keywords [Array<String>]
    # @param related_item_page [Integer, nil]
    # @param relationship_type [String, nil]
    # @param response_groups [Array<String>, nil]
    # @param search_index [String, nil]
    # @return [Rapa::Responses::SearchItemsResponse]
    def search_items(
      domain:,
      item_page: nil,
      keywords:,
      related_item_page: nil,
      relationship_type: nil,
      response_groups: nil,
      search_index: nil
    )
      send_request(
        domain: domain,
        item_page: item_page,
        keywords: keywords,
        query_class: ::Rapa::Queries::SearchItemsQuery,
        related_item_page: related_item_page,
        relationship_type: relationship_type,
        response_class: ::Rapa::Responses::SearchItemsResponse,
        response_groups: response_groups,
        search_index: search_index,
      )
    end

    private

    # @private
    # @return [String]
    def access_key_id
      @access_key_id
    end

    # @private
    # @return [String]
    def associate_tag
      @associate_tag
    end

    # @private
    # @return [Hash]
    def common_query_options
      {
        access_key_id: access_key_id,
        associate_tag: associate_tag,
      }
    end

    # @private
    # @return [String]
    def secret_access_key
      @secret_access_key
    end

    # @private
    # @param domain [String]
    # @param query_class [Class]
    # @param response_class [Class]
    # @return [Rapa::Responses::BaseResponse]
    def send_request(domain:, query_class:, response_class:, **options)
      query_options = common_query_options.merge(options)
      query = query_class.new(query_options)
      url = ::Rapa::Url.new(domain: domain)
      uri = ::URI.parse(url.to_s)
      query_string = query.to_s
      signature = ::Rapa::Signer.new(
        host: uri.host,
        http_method: "GET",
        key: secret_access_key,
        path: uri.path,
        query_string: query_string,
      ).sign
      faraday_response = connection.get(uri, query.to_hash.merge(Signature: signature))
      response_class.new(faraday_response)
    end
  end
end
