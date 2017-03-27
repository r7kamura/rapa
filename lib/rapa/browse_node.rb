module Rapa
  class BrowseNode
    # @return [Hash]
    attr_reader :source

    # @param source [Hash]
    def initialize(source)
      @source = source
    end

    # @return [Array<Rapa::BrowseNode>]
    def ancestors
      array = []
      current = self
      while parent = current.parent do
        array << parent
        current = parent
      end
      array
    end

    # @return [Array<Rapa::BrowseNode>, nil]
    def children
      if child_sources = source.dig("Children", "BrowseNode")
        child_sources.map do |child_source|
          ::Rapa::BrowseNode.new(child_source)
        end
      else
        []
      end
    end

    # @return [Integer]
    def id
      source["BrowseNodeId"].to_i
    end

    # @return [String]
    def name
      source["Name"]
    end

    # @return [Rapa::BrowseNode, nil]
    def parent
      if parent_source = source.dig("Ancestors", "BrowseNode")
        ::Rapa::BrowseNode.new(parent_source)
      end
    end

    # @return [String]
    def title
      source["Title"]
    end
  end
end
