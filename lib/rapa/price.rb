module Rapa
  class Price
    # @return [Hash]
    attr_reader :source

    # @param source [Hash]
    def initialize(source)
      @source = source
    end

    # @return [Integer]
    def amount
      source["Amount"].to_i
    end

    # @return [String]
    def currency_code
      source["CurrencyCode"]
    end

    # @return [String]
    def formatted_price
      source["FormattedPrice"]
    end
  end
end
