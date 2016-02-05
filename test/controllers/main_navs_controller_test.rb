require 'test_helper'

class MainNavsControllerTest < ActionController::TestCase
  setup do
    @main_nav = main_navs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:main_navs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create main_nav" do
    assert_difference('MainNav.count') do
      post :create, main_nav: { title: @main_nav.title, url: @main_nav.url }
    end

    assert_redirected_to main_nav_path(assigns(:main_nav))
  end

  test "should show main_nav" do
    get :show, id: @main_nav
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @main_nav
    assert_response :success
  end

  test "should update main_nav" do
    patch :update, id: @main_nav, main_nav: { title: @main_nav.title, url: @main_nav.url }
    assert_redirected_to main_nav_path(assigns(:main_nav))
  end

  test "should destroy main_nav" do
    assert_difference('MainNav.count', -1) do
      delete :destroy, id: @main_nav
    end

    assert_redirected_to main_navs_path
  end
end
