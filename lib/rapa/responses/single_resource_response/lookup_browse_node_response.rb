module Rapa
  module Responses
    class LookupBrowseNodeResponse < SingleResourceResponse
      # @return [Rapa::Error, nil]
      def error
        if value = body.dig("BrowseNodeLookupErrorResponse", "Error")
          ::Rapa::Error.new(value)
        end
      end

      # @return [Boolean]
      def has_error?
        !error.nil?
      end

      # @return [Boolean]
      def has_valid_request?
        body.dig("BrowseNodeLookupResponse", "BrowseNodes", "Request", "IsValid") == "True"
      end

      # @return [Array<Rapa::Resources::BrowseNodeResource>, nil]
      def response_group(group)
        item = sources.find { |source| source["Type"] == group }
        unless item.nil?
          item["TopItem"].map do |source|
            resource_class.new(source)
          end
        end
      end

      private

      # @note Override
      def resource_class
        ::Rapa::Resources::BrowseNodeResource
      end

      # @note Override
      def source_or_sources
        body.dig("BrowseNodeLookupResponse", "BrowseNodes", "BrowseNode", "TopItemSet")
      end
    end
  end
end
