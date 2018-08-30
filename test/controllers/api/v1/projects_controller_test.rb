require 'test_helper'

class Api::V1::ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get api_v1_projects_url, as: :json
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post api_v1_projects_url, params: { project: { description: @project.description, title: @project.title } }, as: :json
    end

    assert_response 201
  end

  test "should show project" do
    get api_v1_project_url(@project), as: :json
    assert_response :success
  end

  test "should update project" do
    patch api_v1_project_url(@project), params: { project: { description: @project.description, title: @project.title } }, as: :json
    assert_response 200
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete api_v1_project_url(@project), as: :json
    end

    assert_response 204
  end
end
