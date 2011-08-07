require 'test_helper'

class WordtsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wordts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wordt" do
    assert_difference('Wordt.count') do
      post :create, :wordt => { }
    end

    assert_redirected_to wordt_path(assigns(:wordt))
  end

  test "should show wordt" do
    get :show, :id => wordts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => wordts(:one).to_param
    assert_response :success
  end

  test "should update wordt" do
    put :update, :id => wordts(:one).to_param, :wordt => { }
    assert_redirected_to wordt_path(assigns(:wordt))
  end

  test "should destroy wordt" do
    assert_difference('Wordt.count', -1) do
      delete :destroy, :id => wordts(:one).to_param
    end

    assert_redirected_to wordts_path
  end
end
