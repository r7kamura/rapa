module Rapa
  module Responses
    class SearchItemsResponse < BaseResponse
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
