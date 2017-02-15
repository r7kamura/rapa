module Rapa
  module Responses
    class BaseResponse
      include ::Enumerable

      # @param faraday_response [Faraday::Response]
      def initialize(faraday_response)
        @faraday_response = faraday_response
      end

      # @return [String]
      def body
        faraday_response.body
      end

      # @note Implementation for Enumerable
      def each(&block)
        resources.each(&block)
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

      # @return [Array<Rapa::Resources::ItemResource>]
      def resources
        sources.map do |source|
          resource_class.new(source)
        end
      end

      # @return [Integer]
      def status
        faraday_response.status
      end

      private

      # @private
      # @return [Faraday::Response]
      def faraday_response
        @faraday_response
      end

      # @return [Class]
      def resource_class
        raise ::NotImplementedError
      end

      # @private
      def source_or_sources
        raise ::NotImplementedError
      end

      # @private
      # @return [Array<Hash>]
      def sources
        case source_or_sources
        when ::Array
          source_or_sources
        when nil
          []
        else
          [source_or_sources]
        end
      end
    end
  end
end
