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
    def list_items(options)
      query = ::Rapa::Queries::ListItemsQuery.new(
        {
          access_key_id: access_key_id,
          associate_tag: associate_tag,
        }.merge(options),
      )
      url = ::Rapa::Url.new(domain: options[:domain])
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
      ::Rapa::Responses::ListItemsResponse.new(faraday_response)
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
    # @return [String]
    def secret_access_key
      @secret_access_key
    end
  end
end
