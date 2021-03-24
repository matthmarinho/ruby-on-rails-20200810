require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products, as: :json
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products, params: { product: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show product" do
    get product(@product), as: :json
    assert_response :success
  end

  test "should update product" do
    patch product(@product), params: { product: {  } }, as: :json
    assert_response 200
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product(@product), as: :json
    end

    assert_response 204
  end
end
