class RoomsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = "Room created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @room.destroy
    flash[:success] = "Room deleted"
    redirect_to request.referrer || root_url
  end

  private

    def room_params
      params.require(:room).permit(:name)
    end

    def correct_user
      @room = current_user.rooms.find_by(id: params[:id])
      redirect_to root_url if @room.nil?
    end
end


