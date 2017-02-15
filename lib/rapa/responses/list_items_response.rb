module Rapa
  module Responses
    class ListItemsResponse < BaseResponse
      private

      # @note Override
      def resource_class
        ::Rapa::Resources::ItemResource
      end

      # @note Override
      def source_or_sources
        body.dig("ItemLookupResponse", "Items", "Item")
      end
    end
  end
end
