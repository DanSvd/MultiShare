require 'test_helper'

class RoomTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(name: "Room1")
  end

  test "should be valid" do
    assert @room.valid?
  end

  test "user id should be present" do
    @room.user_id = nil
    assert_not @room.valid?
  end

  test "name should be present" do
    @room.name = "   "
    assert_not @room.valid?
  end

  test "name should be at most 23 characters" do
    @room.name = "a" * 23
    assert_not @room.valid?
  end
end
