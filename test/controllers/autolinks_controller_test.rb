# frozen_string_literal: true

require "test_helper"

class AutolinksControllerTest < Redmine::IntegrationTest
  def autolink
    @autolink ||= @project.autolinks.create!(prefix: "EXAMPLE", target_url: "https://a.test/<ref>")
  end

  setup do
    @project = Project.first
    log_user("admin", "admin")
  end

  test "#index" do
    autolink
    get settings_project_path(@project, tab: :autolinks)
    assert_response :success
    assert_match "EXAMPLE", response.body
    assert_match "https://a.test/&lt;ref&gt;", response.body
  end

  test "#new" do
    get new_project_autolink_path(@project)
    assert_response :success
  end

  test "#edit" do
    get edit_project_autolink_path(@project, autolink)
    assert_response :success
  end

  test "#create" do
    post project_autolinks_path(@project),
         params: { autolink: { prefix: "AA", target_url: "http://a.test/<ref>" } }
    assert_response :found
  end

  test "#create with invalid params" do
    post project_autolinks_path(@project),
         params: { autolink: { prefix: "aa", target_url: "http://a.test" } }
    assert_response :unprocessable_entity
  end

  test "#update" do
    put project_autolink_path(@project, autolink), params: { autolink: { prefix: "AA" } }
    assert_response :found
    assert_equal "AA", autolink.reload.prefix
  end

  test "#destroy" do
    delete project_autolink_path(@project, autolink)
    assert_response :found
  end
end
