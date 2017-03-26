require "petitest/autorun"
require "petitest/power_assert"
require "petitest/spec"
require "rapa"

class TestItemResource < Petitest::Test
  extend ::Petitest::Spec
  prepend ::Petitest::PowerAssert

  describe "#ebook?" do
    def source
      content = ::File.read("data/#{asin}.json")
      ::JSON.parse(content)
    end

    context "with source of paper book" do
      def asin
        "4091250157"
      end

      it "returns false" do
        assert do
          ::Rapa::Resources::ItemResource.new(source).ebook? == false
        end
      end
    end

    context "with source of e-book" do
      def asin
        "B06XDNHTX5"
      end

      it "returns true" do
        assert do
          ::Rapa::Resources::ItemResource.new(source).ebook? == true
        end
      end
    end
  end
end
