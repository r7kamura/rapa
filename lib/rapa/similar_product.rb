module Rapa
  class SimilarProduct
    # @return [Hash]
    attr_reader :source

    # @param source [Hash]
    def initialize(source)
      @source = source
    end

    # @return [String]
    def asin
      source["ASIN"]
    end

    # @return [String]
    def title
      source["Title"]
    end
  end
end
