require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @room = rooms(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Room.count' do
      post rooms_path, params: { room: { name: "Room3" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Room.count' do
      delete room_path(@room)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong room" do
    log_in_as(users(:michael))
    room = rooms(:ants)
    assert_no_difference 'Room.count' do
      delete room_path(room)
    end
    assert_redirected_to root_url
  end
end
