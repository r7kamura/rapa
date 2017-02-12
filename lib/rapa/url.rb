module Rapa
  class Url
    # @param domain [String]
    def initialize(domain:)
      @domain = domain
    end

    # @note Override
    def to_s
      "http://webservices.amazon.#{domain}/onca/xml"
    end

    private

    # @private
    # @return [String]
    def domain
      @domain
    end
  end
end
