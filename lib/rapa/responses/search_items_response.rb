module Rapa
  module Responses
    class SearchItemsResponse < BaseResponse
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
