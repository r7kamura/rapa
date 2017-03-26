module Rapa
  module Queries
    class SearchItemsQuery < BaseQuery
      SEARCH_INDEX_DEFAULT = "All"
      OPERATION = "ItemSearch"

      property :ItemPage
      property :Keywords
      property :Power
      property :SearchIndex

      # @return [String, nil]
      def ItemPage
        if options[:item_page]
          options[:item_page].to_s
        end
      end

      # @return [String]
      def Keywords
        options[:keywords].join(",")
      end

      # @note Override
      def Operation
        OPERATION
      end

      # @return [String, nil]
      def Power
        options[:power]
      end

      # @return [String]
      def SearchIndex
        options[:search_index] || SEARCH_INDEX_DEFAULT
      end
    end
  end
end
