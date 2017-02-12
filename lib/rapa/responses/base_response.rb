module Rapa
  module Responses
    class BaseResponse
      # @param faraday_response [Faraday::Response]
      def initialize(faraday_response)
        @faraday_response = faraday_response
      end

      # @return [String]
      def body
        faraday_response.body
      end

      # @todo
      # @return [Boolean]
      def has_error?
        raise "TODO"
      end

      # @return [Faraday::Utils::Headers]
      def headers
        faraday_response.headers
      end

      # @return [Integer]
      def status
        faraday_response.status
      end

      private

      # @return [Faraday::Response]
      def faraday_response
        @faraday_response
      end
    end
  end
end
