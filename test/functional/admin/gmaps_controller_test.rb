# -*- encoding : utf-8 -*-
require 'test_helper'

class Admin::GmapsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
