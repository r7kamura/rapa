module Rapa
  module Responses
    class ListItemsResponse < BaseResponse
      private

      # @note Override
      def resource_class
        ::Rapa::Resources::ItemResource
      end
    end
  end
end
