module Rapa
  class Quantity
    # @return [Hash]
    attr_reader :source

    # @param source [Hash]
    def initialize(source)
      @source = source
    end

    # @return [String]
    def units
      source["Units"]
    end

    # @return [Integer]
    def value
      source["__content__"].to_i
    end
  end
end
