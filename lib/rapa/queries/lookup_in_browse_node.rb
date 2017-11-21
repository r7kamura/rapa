module Rapa
  module Queries
    class LookupInBrowseNode < BaseQuery
      OPERATION = "BrowseNodeLookup"

      property :BrowseNodeId

      # @return [String, nil]
      def BrowseNodeId
        options[:browse_node_id].to_s
      end

      # @note Override
      def Operation
        OPERATION
      end
    end
  end
end
