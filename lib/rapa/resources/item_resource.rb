require "date"

module Rapa
  module Resources
    class ItemResource < BaseResource
      # @return [Boolean, nil]
      def adult_product?
        if flag_source = source.dig("ItemAttributes", "IsAdultProduct")
          flag_source != "0"
        end
      end

      # @return [String]
      def asin
        source["ASIN"]
      end

      # @return [Array<String>, nil]
      def authors
        if author_sources = source.dig("ItemAttributes", "Author")
          Array(author_sources)
        end
      end

      # @return [String, nil]
      def binding
        source.dig("ItemAttributes", "Binding")
      end

      # @return [Array, nil]
      def browse_nodes
        source.dig("BrowseNodes", "BrowseNode")
      end

      # @return [String, nil]
      def creator_name
        source.dig("ItemAttributes", "Creator", "__content__")
      end

      # @return [String, nil]
      def creator_role
        source.dig("ItemAttributes", "Creator", "Role")
      end

      # @return [String, nil]
      def ean
        source.dig("ItemAttributes", "EAN")
      end

      # @return [Boolean]
      def has_customer_review?
        source.dig("CustomerReviews", "HasReviews") == "true"
      end

      # @return [Rapa::Image, nil]
      def image_hi_res
        find_image("HiResImage")
      end

      # @return [Rapa::Image, nil]
      def image_large
        find_image("LargeImage")
      end

      # @return [Rapa::Image, nil]
      def image_medium
        find_image("MediumImage")
      end

      # @return [Rapa::Image, nil]
      def image_small
        find_image("SmallImage")
      end

      # @return [Rapa::Image, nil]
      def image_swatch
        find_image("SwatchImage")
      end

      # @return [Rapa::Image, nil]
      def image_thumbnail
        find_image("ThumbnailImage")
      end

      # @return [Rapa::Image, nil]
      def image_tiny
        find_image("TinyImage")
      end

      # @return [String, nil]
      def isbn
        source.dig("ItemAttributes", "ISBN")
      end

      # @return [Rapa::Quantity]
      def item_height
        if quantity_source = source.dig("ItemAttributes", "ItemDimensions", "Height")
          ::Rapa::Quantity.new(quantity_source)
        end
      end

      # @return [Rapa::Quantity]
      def item_length
        if quantity_source = source.dig("ItemAttributes", "ItemDimensions", "Length")
          ::Rapa::Quantity.new(quantity_source)
        end
      end

      # @return [Rapa::Quantity]
      def item_width
        if quantity_source = source.dig("ItemAttributes", "ItemDimensions", "Width")
          ::Rapa::Quantity.new(quantity_source)
        end
      end

      # @return [String, nil]
      def label
        source.dig("ItemAttributes", "Label")
      end

      # @return [String, nil]
      def language_name
        source.dig("ItemAttributes", "Languages", "Language", "Name")
      end

      # @return [String, nil]
      def manufacturer
        source.dig("ItemAttributes", "Manufacturer")
      end

      # @return [Integer, nil]
      def number_of_pages
        if value = source.dig("ItemAttributes", "NumberOfPages")
          value.to_i
        end
      end

      # @return [Rapa::Quantity]
      def package_height
        if quantity_source = source.dig("ItemAttributes", "PackageDimensions", "Height")
          ::Rapa::Quantity.new(quantity_source)
        end
      end

      # @return [Rapa::Quantity]
      def package_length
        if quantity_source = source.dig("ItemAttributes", "PackageDimensions", "Length")
          ::Rapa::Quantity.new(quantity_source)
        end
      end

      # @return [Rapa::Quantity]
      def package_weight
        if quantity_source = source.dig("ItemAttributes", "PackageDimensions", "Weight")
          ::Rapa::Quantity.new(quantity_source)
        end
      end

      # @return [Rapa::Quantity]
      def package_width
        if quantity_source = source.dig("ItemAttributes", "PackageDimensions", "Width")
          ::Rapa::Quantity.new(quantity_source)
        end
      end

      # @return [String, nil]
      def product_group
        source.dig("ItemAttributes", "ProductGroup")
      end

      # @return [String, nil]
      def product_type_name
        source.dig("ItemAttributes", "ProductTypeName")
      end

      # @return [Date, nil]
      def publication_date
        if value = source.dig("ItemAttributes", "PublicationDate")
          ::Date.parse(value)
        end
      end

      # @return [String, nil]
      def publisher
        source.dig("ItemAttributes", "Publisher")
      end

      # @return [Date, nil]
      def release_date
        if value = source.dig("ItemAttributes", "ReleaseDate")
          ::Date.parse(value)
        end
      end

      # @return [Integer, nil]
      def sales_rank
        source["SalesRank"]
      end

      # @return [Array<Rapa::SimilarProduct>, nil]
      def similar_products
        if similar_product_sources = source["SimilarProducts"]
          similar_product_sources.map do |similar_product_source|
            ::Rapa::SimilarProduct.new(similar_product_source)
          end
        end
      end

      # @return [String, nil]
      def studio
        source.dig("ItemAttributes", "Studio")
      end

      # @return [String, nil]
      def title
        source.dig("ItemAttributes", "Title")
      end

      # @return [String, nil]
      def url_add_to_wishlist
        item_links["Add To Wishlist"]
      end

      # @return [String, nil]
      def url_all_customer_reviews
        item_links["All Customer Reviews"]
      end

      # @return [String, nil]
      def url_all_offers
        item_links["All Offers"]
      end

      # @return [String, nil]
      def url_customer_reviews_iframe
        source.dig("CustomerReviews", "IFrameURL")
      end

      # @return [String]
      def url_details_page
        source["DetailPageURL"]
      end

      # @return [String, nil]
      def url_tell_a_friend
        item_links["Tell A Friend"]
      end

      private

      # @param key [String]
      # @return [Rapa::Image, nil]
      def find_image(key)
        if image_source = (source[key] || source.dig("ImageSets", "ImageSet", key))
          ::Rapa::Image.new(image_source)
        end
      end

      # @private
      # @return [Hash, nil]
      def item_attributes
        source["ItemAttributes"]
      end

      # @private
      # @return [Hash]
      def item_links
        @item_links ||= source["ItemLinks"]["ItemLink"].each_with_object({}) do |element, result|
          result[element["Description"]] = element["URL"]
        end
      end
    end
  end
end
