module Rapa
  module Resources
    class BrowseNodeResource < BaseResource
      # @return [String]
      def asin
        source["ASIN"]
      end

      # @return [String]
      def author
        source["Author"]
      end

      # @return [Boolean]
      def ebook?
        source["ProductGroup"] == "eBooks"
      end

      # @return [String]
      def product_group
        source["ProductGroup"]
      end

      # @return [String]
      def title
        source["Title"]
      end

      # @return [String]
      def url_details_page
        source["DetailPageURL"]
      end
    end
  end
end
