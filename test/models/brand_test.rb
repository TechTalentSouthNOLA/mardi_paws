require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "brand attributes must not be empty" do
    brand = Brand.new
    assert_not brand.save, "saved brand with empty attributes"
  end

  test "brand name should be unique" do
    brand = Brand.new
    brand.name = brands(:one).name
    assert_not brand.save, "saved brand with non-unique name"
  end

  test "brand saves with all valid attributes" do
    brand = Brand.new(name: "unique_brand")
    assert brand.save, "brand wasn't saved when valid attributes supplied"
  end
end
