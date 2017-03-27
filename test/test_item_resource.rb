require "petitest/autorun"
require "petitest/power_assert"
require "petitest/spec"
require "rapa"

class TestItemResource < Petitest::Test
  extend ::Petitest::Spec
  prepend ::Petitest::PowerAssert

  let(:asin) do
    "4091250157"
  end

  let(:item_resource) do
    ::Rapa::Resources::ItemResource.new(source)
  end

  let(:source) do
    content = ::File.read("data/#{asin}.json")
    ::JSON.parse(content)
  end

  describe "#browse_nodes" do
    let(:subject) do
      item_resource.browse_nodes
    end

    it "returns an Array of Rapa::BrowseNode" do
      assert do
        subject.is_a?(::Array)
      end

      assert do
        subject[0].id == 2278488051
      end

      assert do
        subject[0].name == "コミック"
      end

      assert do
        subject[0].ancestors[0].name == "コミック・ラノベ・BL"
      end

      assert do
        subject[0].ancestors[1].name == "ジャンル別"
      end

      assert do
        subject[0].ancestors[2].name == "本"
      end

      assert do
        subject[0].ancestors[3].nil?
      end

      assert do
        subject[0].self_or_ancestors[0].name == "コミック"
      end

      assert do
        subject[0].self_or_ancestors[1].name == "コミック・ラノベ・BL"
      end

      assert do
        subject[0].self_or_ancestors.length == 4
      end
    end
  end

  describe "#ebook?" do
    let(:subject) do
      item_resource.ebook?
    end

    context "with source of paper book" do
      it "returns false" do
        assert { subject == false }
      end
    end

    context "with source of e-book" do
      let(:asin) do
        "B06XDNHTX5"
      end

      it "returns true" do
        assert { subject == true }
      end
    end
  end
end
