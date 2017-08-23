module Rapa
  module Responses
    class ListItemsResponse < BaseResponse
      # @return [Rapa::Error]
      def error
        if value = body.dig("ItemLookupErrorResponse", "Error")
          ::Rapa::Error.new(value)
        end
      end

      # @return [Boolean]
      def has_error?
        !error.nil?
      end

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
