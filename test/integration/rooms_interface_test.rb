require 'test_helper'

class RoomsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "room interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Room.count' do
      post rooms_path, params: { room: { name: "" } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    content = "This room really ties the room together"
    assert_difference 'Room.count', 1 do
      post rooms_path, params: { room: { name: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', text: 'delete'
    first_room = @user.rooms.paginate(page: 1).first
    assert_difference 'Room.count', -1 do
      delete room_path(first_room)
    end
    # Visit different user (no delete links)
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end
