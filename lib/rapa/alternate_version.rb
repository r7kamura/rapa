module Rapa
  class AlternateVersion
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
    def binding
      source["Binding"]
    end

    # @return [String]
    def title
      source["Title"]
    end
  end
end
