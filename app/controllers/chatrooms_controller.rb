class ChatroomsController < ApplicationController
  def create
    chatroom = Chatroom.create!(name: "Found your item", finder_user_id: current_user.id, user_id: params[:chatroom][:user_id])
    redirect_to chatroom_path(chatroom)
  end

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:user)
  end
end
