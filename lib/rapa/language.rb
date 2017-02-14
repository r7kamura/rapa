module Rapa
  class Language
    # @return [Hash]
    attr_reader :source

    # @param source [Hash]
    def initialize(source)
      @source = source
    end

    # @return [String]
    def name
      source["Name"]
    end

    # @return [String]
    def type
      source["Type"]
    end
  end
end
