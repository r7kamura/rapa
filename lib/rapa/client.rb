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

    # @param options [Hash]
    # @return [Rapa::Responses::ListItemsResponse]
    def list_items(**options)
      send_request(
        query_class: ::Rapa::Queries::ListItemsQuery,
        response_class: ::Rapa::Responses::ListItemsResponse,
        **options,
      )
    end

    # @param options [Hash]
    # @return [Rapa::Responses::SearchItemsResponse]
    def search_items(options)
      send_request(
        query_class: ::Rapa::Queries::SearchItemsQuery,
        response_class: ::Rapa::Responses::SearchItemsResponse,
        **options,
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
