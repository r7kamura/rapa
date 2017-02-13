module Rapa
  module Resources
    class ItemResource < BaseResource
      # @return [String]
      def asin
        source["ASIN"]
      end

      # @return [Array<String>, nil]
      def authors
        if item_attributes
          Array(item_attributes["Author"])
        end
      end

      # @return [String, nil]
      def creator_name
        if item_attributes && item_attributes["Creator"]
          item_attributes["Creator"]["__content__"]
        end
      end

      # @return [String, nil]
      def creator_role
        if item_attributes && item_attributes["Creator"]
          item_attributes["Creator"]["Role"]
        end
      end

      # @return [String, nil]
      def manufacturer
        if item_attributes
          item_attributes["Manufacturer"]
        end
      end

      # @return [String, nil]
      def product_group
        if item_attributes
          item_attributes["ProductGroup"]
        end
      end

      # @return [String, nil]
      def title
        if item_attributes
          item_attributes["Title"]
        end
      end

      # @return [String, nil]
      def url_add_to_wishlist
        find_item_link("Add To Wishlist")["URL"]
      end

      # @return [String, nil]
      def url_all_customer_reviews
        find_item_link("All Customer Reviews")["URL"]
      end

      # @return [String, nil]
      def url_all_offers
        find_item_link("All Offers")["URL"]
      end

      # @return [String]
      def url_details_page
        source["DetailPageURL"]
      end

      # @return [String, nil]
      def url_tell_a_friend
        find_item_link("Tell A Friend")["URL"]
      end

      private

      # @param description [String]
      # @return [Hash]
      def find_item_link(description)
        source["ItemLinks"]["ItemLink"].find do |hash|
          hash["Description"] == description
        end
      end

      # @return [Hash, nil]
      def item_attributes
        source["ItemAttributes"]
      end
    end
  end
end
