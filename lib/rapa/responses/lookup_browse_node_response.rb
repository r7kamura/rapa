module Rapa
  module Responses
    class LookupBrowseNodeResponse < BaseResponse
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

      # @return [Array<Rapa::Resources::ItemResource>, nil]
      def new_releases
        item = sources.find { |source| source["Type"] == "NewReleases" }
        unless item.nil?
          item["TopItem"].map do |source|
            resource_class.new(source)
          end
        end
      end

      # @return [Array<Rapa::Resources::ItemResource>, nil]
      def most_gifted
        item = sources.find { |source| source["Type"] == "MostGifted" }
        unless item.nil?
          item["TopItem"].map do |source|
            resource_class.new(source)
          end
        end
      end

      # @return [Array<Rapa::Resources::ItemResource>, nil]
      def most_wished_for
        item = sources.find { |source| source["Type"] == "MostWishedFor" }
        unless item.nil?
          item["TopItem"].map do |source|
            resource_class.new(source)
          end
        end
      end

      # @return [Array<Rapa::Resources::ItemResource>, nil]
      def top_sellers
        item = sources.find { |source| source["Type"] == "TopSellers" }
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
