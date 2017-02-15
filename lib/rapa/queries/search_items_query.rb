module Rapa
  module Queries
    class SearchItemsQuery < BaseQuery
      SEARCH_INDEX_DEFAULT = "All"
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
        options[:search_index] || SEARCH_INDEX_DEFAULT
      end
    end
  end
end
