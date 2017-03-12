module Rapa
  module Queries
    class ListItemsQuery < BaseQuery
      OPERATION = "ItemLookup"

      property :IdType
      property :ItemId
      property :SearchIndex

      # @return [String, nil]
      def IdType
        options[:id_type]
      end

      # @return [String]
      def ItemId
        options[:item_ids].join(",")
      end

      # @note Override
      def Operation
        OPERATION
      end

      # @return [String, nil]
      def SearchIndex
        options[:search_index]
      end
    end
  end
end
