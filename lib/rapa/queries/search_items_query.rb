module Rapa
  module Queries
    class SearchItemsQuery < BaseQuery
      OPERATION = "ItemSearch"

      property :Keywords
      property :SearchIndex

      # @return [Array<String>]
      def Keywords
        options[:keywords].join(",")
      end

      # @note Override
      def Operation
        OPERATION
      end

      # @return [String]
      def SearchIndex
        options[:search_index]
      end
    end
  end
end
