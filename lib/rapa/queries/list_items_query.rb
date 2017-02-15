module Rapa
  module Queries
    class ListItemsQuery < BaseQuery
      OPERATION = "ItemLookup"

      property :ItemId

      # @return [String]
      def ItemId
        options[:asins].join(",")
      end

      # @note Override
      def Operation
        OPERATION
      end
    end
  end
end
