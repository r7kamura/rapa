module Rapa
  class Error
    # @return [Hash]
    attr_reader :source

    # @param source [Hash]
    def initialize(source)
      @source = source
    end

    # @return [String]
    def code
      source["Code"]
    end

    # @return [String]
    def message
      source["Message"]
    end
  end
end
