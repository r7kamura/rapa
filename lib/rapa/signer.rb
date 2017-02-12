require "base64"
require "openssl"

module Rapa
  class Signer
    # @param host [String]
    # @param http_method [String]
    # @param key [String]
    # @param path [String]
    # @param query_string [String]
    def initialize(host:, http_method:, key:, path:, query_string:)
      @host = host
      @http_method = http_method
      @key = key
      @path = path
      @query_string = query_string
    end

    # @return [String]
    def sign
      ::Base64.encode64(
        ::OpenSSL::HMAC.digest(
          digest,
          key,
          source,
        ),
      ).chomp
    end

    private

    # @private
    # @return [OpenSSL::Digest]
    def digest
      ::OpenSSL::Digest.new("sha256")
    end

    # @private
    # @return [String]
    def host
      @host
    end

    # @private
    # @return [String]
    def http_method
      @http_method
    end

    # @private
    # @return [String]
    def key
      @key
    end

    # @private
    # @return [String]
    def path
      @path
    end

    # @private
    # @return [String]
    def query_string
      @query_string
    end

    # @private
    # @return [String]
    def source
      [
        http_method,
        host,
        path,
        query_string,
      ].join("\n")
    end
  end
end
