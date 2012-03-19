# -*- encoding : utf-8 -*-
require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get price" do
    get :price
    assert_response :success
  end

  test "should get images" do
    get :images
    assert_response :success
  end

  test "should get video" do
    get :video
    assert_response :success
  end

  test "should get gmaps" do
    get :gmaps
    assert_response :success
  end

end
