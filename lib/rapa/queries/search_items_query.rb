module Rapa
  module Queries
    class SearchItemsQuery < BaseQuery
      SEARCH_INDEX_DEFAULT = "All"
      OPERATION = "ItemSearch"

      property :BrowseNode
      property :ItemPage
      property :Keywords
      property :Power
      property :SearchIndex

      # @return [String, nil]
      def BrowseNode
        if options[:browse_node_id]
          options[:browse_node_id].to_s
        end
      end

      # @return [String, nil]
      def ItemPage
        if options[:item_page]
          options[:item_page].to_s
        end
      end

      # @return [String, nil]
      def Keywords
        if options[:keywords] && options[:keywords].any?
          options[:keywords].join(",")
        end
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
