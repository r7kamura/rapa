require "faraday"
require "faraday_middleware"

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
      end
    end

    # @param asin [String]
    # @param domain [String]
    # @return [Rapa::Responses::GetItemResponse]
    def get_item(asin:, domain:)
      query = ::Rapa::Queries::GetItemQuery.new(asin: asin)
      url = ::Rapa::Url.new(domain: domain)
      faraday_response = connection.get(url, query)
      ::Rapa::Responses::GetItemResponse.new(faraday_response)
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
