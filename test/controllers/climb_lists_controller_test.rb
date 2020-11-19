require 'test_helper'

class ClimbListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @climb_list = climb_lists(:one)
  end

  test "should get index" do
    get climb_lists_url, as: :json
    assert_response :success
  end

  test "should create climb_list" do
    assert_difference('ClimbList.count') do
      post climb_lists_url, params: { climb_list: { description: @climb_list.description, name: @climb_list.name } }, as: :json
    end

    assert_response 201
  end

  test "should show climb_list" do
    get climb_list_url(@climb_list), as: :json
    assert_response :success
  end

  test "should update climb_list" do
    patch climb_list_url(@climb_list), params: { climb_list: { description: @climb_list.description, name: @climb_list.name } }, as: :json
    assert_response 200
  end

  test "should destroy climb_list" do
    assert_difference('ClimbList.count', -1) do
      delete climb_list_url(@climb_list), as: :json
    end

    assert_response 204
  end
end
