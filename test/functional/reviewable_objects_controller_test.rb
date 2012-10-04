require 'test_helper'

class ReviewableObjectsControllerTest < ActionController::TestCase
  setup do
    @reviewable_object = reviewable_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reviewable_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reviewable_object" do
    assert_difference('ReviewableObject.count') do
      post :create, reviewable_object: {  }
    end

    assert_redirected_to reviewable_object_path(assigns(:reviewable_object))
  end

  test "should show reviewable_object" do
    get :show, id: @reviewable_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reviewable_object
    assert_response :success
  end

  test "should update reviewable_object" do
    put :update, id: @reviewable_object, reviewable_object: {  }
    assert_redirected_to reviewable_object_path(assigns(:reviewable_object))
  end

  test "should destroy reviewable_object" do
    assert_difference('ReviewableObject.count', -1) do
      delete :destroy, id: @reviewable_object
    end

    assert_redirected_to reviewable_objects_path
  end
end
