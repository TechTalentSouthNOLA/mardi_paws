require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @product = products(:one)
    @product_new = {
      name: 'unique_name',
      brand_id: 1,
      category_id: 1,
      description: 'some text',
      current_price: '1.00',
      quantity: 1
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "logged in should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "not authenticated should get redirect for new" do
    get :new
    assert_response :redirect
  end

  test "logged in should create product" do
    sign_in users(:one)
    assert_difference('Product.count') do
      post :create, product: @product_new
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "logged in should get edit" do
    sign_in users(:one)
    get :edit, id: @product
    assert_response :success
  end

  test "not authenticated should get redirect for edit" do
    get :edit, id: @product
    assert_response :redirect
  end

  test "logged in should update product" do
    sign_in users(:one)
    patch :update, id: @product, product: { brand_id: @product.brand_id, category_id: @product.category_id, current_price: @product.current_price, description: @product.description, name: @product.name, quantity: @product.quantity }
    assert_redirected_to product_path(assigns(:product))
  end

  test "logged in should destroy product" do
    sign_in users(:one)
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
