module Rapa
  module Responses
    class SearchItemsResponse < BaseResponse
      private

      # @note Override
      def resource_class
        ::Rapa::Resources::ItemResource
      end
    end
  end
end
