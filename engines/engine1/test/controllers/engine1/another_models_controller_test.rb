require 'test_helper'

module Engine1
  class AnotherModelsControllerTest < ActionController::TestCase
    setup do
      @another_model = another_models(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:another_models)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create another_model" do
      assert_difference('AnotherModel.count') do
        post :create, another_model: {  }
      end

      assert_redirected_to another_model_path(assigns(:another_model))
    end

    test "should show another_model" do
      get :show, id: @another_model
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @another_model
      assert_response :success
    end

    test "should update another_model" do
      patch :update, id: @another_model, another_model: {  }
      assert_redirected_to another_model_path(assigns(:another_model))
    end

    test "should destroy another_model" do
      assert_difference('AnotherModel.count', -1) do
        delete :destroy, id: @another_model
      end

      assert_redirected_to another_models_path
    end
  end
end
