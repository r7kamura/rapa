module Rapa
  class Image
    # @return [Hash]
    attr_reader :source

    # @param source [Hash]
    def initialize(source)
      @source = source
    end

    # @return [Integer]
    def height
      ::Rapa::Quantity.new(source["Height"])
    end

    # @return [String]
    def url
      source["URL"]
    end

    # @return [Integer]
    def width
      ::Rapa::Quantity.new(source["Width"])
    end
  end
end
