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
    content = ::File.read("test/data/#{asin}.json")
    ::JSON.parse(content)
  end

  describe "#alternate_versions" do
    let(:subject) do
      item_resource.alternate_versions
    end

    it "returns an Array of Rapa::AlternateVersion" do
      assert do
        subject.is_a?(::Array)
      end

      assert do
        subject[0].is_a?(::Rapa::AlternateVersion)
      end
    end
  end

  describe "#authors" do
    let(:subject) do
      item_resource.authors
    end

    it "returns an Array of String" do
      assert do
        subject.is_a?(::Array)
      end

      assert do
        subject[0].is_a?(::String)
      end
    end
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

  describe "#creator_name" do
    let(:subject) do
      item_resource.creator_name
    end

    it "returns first creator's name" do
      assert do
        subject == item_resource.creators.first.name
      end
    end
  end

  describe "#creator_role" do
    let(:subject) do
      item_resource.creator_role
    end

    it "returns first creator's role" do
      assert do
        subject == item_resource.creators.first.role
      end
    end
  end

  describe "creators" do
    let(:subject) do
      item_resource.creators
    end

    it "returns an Array of Rapa::Creator" do
      assert do
        subject.is_a?(::Array)
      end

      assert do
        subject[0].is_a?(::Rapa::Creator)
      end

      assert do
        subject[0].name == "ガモウひろし"
      end

      assert do
        subject[0].role == "翻訳"
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

  describe "#languages" do
    let(:subject) do
      item_resource.languages
    end

    it "returns an Array of Rapa::Language" do
      assert do
        subject.is_a?(::Array)
      end

      assert do
        subject[0].is_a?(::Rapa::Language)
      end

      assert do
        subject[0].name == "日本語"
      end
    end
  end

  describe "#price_lowest_collectible" do
    let(:subject) do
      item_resource.price_lowest_collectible
    end

    it "returns a Rapa::Price" do
      assert do
        subject.is_a?(::Rapa::Price)
      end
    end
  end

  describe "#price_lowest_new" do
    let(:subject) do
      item_resource.price_lowest_new
    end

    it "returns a Rapa::Price" do
      assert do
        subject.is_a?(::Rapa::Price)
      end

      assert do
        subject.amount == 596
      end

      assert do
        subject.currency_code == "JPY"
      end

      assert do
        subject.formatted_price == "￥ 596"
      end
    end
  end

  describe "#price_lowest_used" do
    let(:subject) do
      item_resource.price_lowest_used
    end

    it "returns a Rapa::Price" do
      assert do
        subject.is_a?(::Rapa::Price)
      end
    end
  end

  describe "#publication_date" do
    let(:subject) do
      item_resource.publication_date
    end

    it "returns a Date" do
      assert do
        subject == ::Date.new(2014, 6, 12)
      end
    end
  end

  describe "#related_items" do
    let(:subject) do
      item_resource.related_items
    end

    it "returns an Array" do
      assert do
        subject.is_a?(::Array)
      end
    end
  end

  describe "#release_date" do
    let(:subject) do
      item_resource.release_date
    end

    it "returns a Date" do
      assert do
        subject == ::Date.new(2014, 6, 12)
      end
    end
  end

  describe "#similar_products" do
    let(:subject) do
      item_resource.similar_products
    end

    it "returns an Array" do
      assert do
        subject.is_a?(::Array)
      end
    end
  end
end
