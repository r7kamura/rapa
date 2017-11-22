require "petitest/autorun"
require "petitest/power_assert"
require "petitest/spec"
require "rapa"

class TestBrowseNodeResource < Petitest::Test
  extend ::Petitest::Spec
  prepend ::Petitest::PowerAssert

  let(:asin) do
    "B075SWSZ1Z"
  end

  let(:browse_node_resource) do
    ::Rapa::Resources::BrowseNodeResource.new(source)
  end

  let(:source) do
    content = ::File.read("test/data/#{asin}.json")
    ::JSON.parse(content)
  end

  describe "#author" do
    let(:subject) do
      browse_node_resource.author
    end

    it 'return a author' do
      assert do
        subject == '原泰久'
      end
    end
  end

  describe "#ebook?" do
    let(:subject) do
      browse_node_resource.ebook?
    end

    it 'return a boolean' do
      assert do
        subject == true
      end
    end
  end

  describe "#title" do
    let(:subject) do
      browse_node_resource.title
    end

    it 'return a title' do
      assert do
        subject == 'キングダム 48 (ヤングジャンプコミックスDIGITAL)'
      end
    end
  end
end
