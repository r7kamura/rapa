require "petitest/autorun"
require "petitest/power_assert"
require "rapa"
require "timecop"

class TestSearchItemsQuery < Petitest::Test
  prepend ::Petitest::PowerAssert

  def test_to_hash
    freeze_time
    expected = {
      "AssociateTag" => "dummy_associate_tag",
      "AWSAccessKeyId" => "dummy_access_key_id",
      "Keywords" => "dummy_keyword1%2Cdummy_keyword2",
      "Operation" => "ItemSearch",
      "SearchIndex" => "All",
      "Service" => "AWSECommerceService",
      "Timestamp" => "2000-01-01T00%3A00%3A00Z",
      "Version" => "2013-08-01",
    }
    actual = ::Rapa::Queries::SearchItemsQuery.new(
      access_key_id: "dummy_access_key_id",
      associate_tag: "dummy_associate_tag",
      keywords: %w(
        dummy_keyword1
        dummy_keyword2
      )
    ).to_hash
    assert do
      actual == expected
    end
    return_time
  end

  private

  def freeze_time
    now = ::Time.utc(2000)
    ::Timecop.freeze(now)
  end

  def return_time
    ::Timecop.return
  end
end
