require 'test_helper'

class AppsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app = apps(:one)
  end

  test "should get index" do
    get apps_url, as: :json
    assert_response :success
  end

  test "should create app" do
    assert_difference('App.count') do
      post apps_url, params: { app: { access_token: @app.access_token, active: @app.active, app_type: @app.app_type, approved: @app.approved, name: @app.name, pending_approval: @app.pending_approval, soft_delete: @app.soft_delete, suspended: @app.suspended, uidn: @app.uidn, user_id: @app.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show app" do
    get app_url(@app), as: :json
    assert_response :success
  end

  test "should update app" do
    patch app_url(@app), params: { app: { access_token: @app.access_token, active: @app.active, app_type: @app.app_type, approved: @app.approved, name: @app.name, pending_approval: @app.pending_approval, soft_delete: @app.soft_delete, suspended: @app.suspended, uidn: @app.uidn, user_id: @app.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy app" do
    assert_difference('App.count', -1) do
      delete app_url(@app), as: :json
    end

    assert_response 204
  end
end
