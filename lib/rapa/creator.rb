module Rapa
  class Creator
    # @return [Array]
    attr_reader :source

    def initialize(source)
      @source = source
    end

    def names
      @source.map { |x| x["__content__"] }
    end

    def roles
      @source.map { |x| x["Role"] }
    end
  end
end
