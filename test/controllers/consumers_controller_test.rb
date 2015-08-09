require 'test_helper'

class ConsumersControllerTest < ActionController::TestCase
  setup do
    @consumer = consumers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consumers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consumer" do
    assert_difference('Consumer.count') do
      post :create, consumer: { active: @consumer.active, actor_id: @consumer.actor_id, address: @consumer.address, enabled: @consumer.enabled, name: @consumer.name, power: @consumer.power, priority: @consumer.priority, switch_interval: @consumer.switch_interval, switched_at: @consumer.switched_at }
    end

    assert_redirected_to consumer_path(assigns(:consumer))
  end

  test "should show consumer" do
    get :show, id: @consumer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consumer
    assert_response :success
  end

  test "should update consumer" do
    patch :update, id: @consumer, consumer: { active: @consumer.active, actor_id: @consumer.actor_id, address: @consumer.address, enabled: @consumer.enabled, name: @consumer.name, power: @consumer.power, priority: @consumer.priority, switch_interval: @consumer.switch_interval, switched_at: @consumer.switched_at }
    assert_redirected_to consumer_path(assigns(:consumer))
  end

  test "should destroy consumer" do
    assert_difference('Consumer.count', -1) do
      delete :destroy, id: @consumer
    end

    assert_redirected_to consumers_path
  end
end
