require 'test_helper'

class SomeModelsControllerTest < ActionController::TestCase
  setup do
    @some_model = some_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:some_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create some_model" do
    assert_difference('SomeModel.count') do
      post :create, some_model: { name: @some_model.name }
    end

    assert_redirected_to some_model_path(assigns(:some_model))
  end

  test "should show some_model" do
    get :show, id: @some_model
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @some_model
    assert_response :success
  end

  test "should update some_model" do
    patch :update, id: @some_model, some_model: { name: @some_model.name }
    assert_redirected_to some_model_path(assigns(:some_model))
  end

  test "should destroy some_model" do
    assert_difference('SomeModel.count', -1) do
      delete :destroy, id: @some_model
    end

    assert_redirected_to some_models_path
  end
end
