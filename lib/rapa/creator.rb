module Rapa
  class Creator
    # @return [Hash]
    attr_reader :source

    # @param source [Hash]
    def initialize(source)
      @source = source
    end

    # @return [String]
    def name
      source["__content__"]
    end

    # @return [String]
    def role
      source["Role"]
    end
  end
end
