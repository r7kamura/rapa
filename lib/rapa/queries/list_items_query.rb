require "time"

module Rapa
  module Queries
    class ListItemsQuery < BaseQuery
      OPERATION = "ItemLookup"
      SERVICE = "AWSECommerceService"
      VERSION = "2013-08-01"

      property :AssociateTag
      property :AWSAccessKeyId
      property :ItemId
      property :Operation
      property :RelatedItemPage
      property :RelationshipType
      property :ResponseGroup
      property :Service
      property :Timestamp
      property :Version

      # @return [String]
      def AssociateTag
        options[:associate_tag]
      end

      # @return [String]
      def AWSAccessKeyId
        options[:access_key_id]
      end

      # @return [String]
      def ItemId
        options[:asins].join(",")
      end

      # @return [String]
      def Operation
        OPERATION
      end

      # @return [Integer, nil]
      def RelatedItemPage
        options[:related_item_page]
      end

      # @return [String, nil]
      def RelationshipType
        options[:relationship_type]
      end

      # @return [String, nil]
      def ResponseGroup
        if options[:response_groups]
          options[:response_groups].join(",")
        end
      end

      # @return [String]
      def Service
        SERVICE
      end

      # @return [String]
      def Timestamp
        ::Time.now.utc.iso8601
      end

      # @return [String]
      def Version
        VERSION
      end
    end
  end
end
