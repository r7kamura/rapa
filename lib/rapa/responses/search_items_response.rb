module Rapa
  module Responses
    class SearchItemsResponse < BaseResponse
      # @return [Rapa::Error]
      def error
        if value = body.dig("ItemSearchResponse", "Items", "Request", "Errors", "Error")
          ::Rapa::Error.new(value)
        end
      end

      # @return [Boolean]
      def has_error?
        !error.nil?
      end

      # @return [Boolean]
      def has_valid_request?
        body.dig("ItemSearchResponse", "Items", "Request", "IsValid") == "True"
      end

      # @return [Integer, nil]
      def total_pages
        if value = body.dig("ItemSearchResponse", "Items", "TotalPages")
          value.to_i
        end
      end

      # @return [Integer, nil]
      def total_results
        if value = body.dig("ItemSearchResponse", "Items", "TotalResults")
          value.to_i
        end
      end

      private

      # @note Override
      def resource_class
        ::Rapa::Resources::ItemResource
      end

      # @note Override
      def source_or_sources
        body.dig("ItemSearchResponse", "Items", "Item")
      end
    end
  end
end
