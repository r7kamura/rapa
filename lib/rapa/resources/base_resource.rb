module Rapa
  module Resources
    class BaseResource
      # @param source [Hash]
      def initialize(source)
        @source = source
      end

      # @return [Hash]
      def source
        @source
      end
    end
  end
end
