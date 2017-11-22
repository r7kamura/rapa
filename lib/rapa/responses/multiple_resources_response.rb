module Rapa
  module Responses
    class MultipleResourcesResponse < BaseResponse
      include ::Enumerable

      # @note Implementation for Enumerable
      def each(&block)
        resources.each(&block)
      end

      # @return [Array<Rapa::Resources::ItemResource>]
      def resources
        sources.map do |source|
          resource_class.new(source)
        end
      end
    end
  end
end
