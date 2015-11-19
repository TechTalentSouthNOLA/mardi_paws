require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "product attributes must not be empty" do
    product = Product.new
    product.save

    assert product.errors[:name].any?, "name must be present"
    assert product.errors[:description].any?, "description must be present"
    assert product.errors[:category_id].any?, "category_id must be present"
    assert product.errors[:brand_id].any?, "brand_id must be present"

    assert_not product.save, "saved product with empty attributes"
  end

  test "product name should be unique" do
    product = Product.new
    product.name = products(:one).name
    assert_not product.save, "saved product with non-unique name"
  end

  test "product price must be positive and greater than 0" do
    product = Product.new(name: 'my product', description: 'my description', category_id: 1, brand_id: 1)

    product.current_price = 0
    assert product.invalid?, 'invalid product'
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:current_price]

    product.current_price = 1
    assert product.valid?, "valid product when should be valid"
  end
end
