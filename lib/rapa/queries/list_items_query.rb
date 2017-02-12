module Rapa
  module Queries
    class ListItemsQuery < BaseQuery
      OPERATION = "ItemLookUp"

      property :ItemId
      property :Operation
      property :ResponseGroup

      # @return [String]
      def ItemId
        options[:asins].join(",")
      end

      # @return [String]
      def Operation
        OPERATION
      end

      # @return [String]
      def ResponseGroup
        options[:response_groups].join(",")
      end
    end
  end
end
