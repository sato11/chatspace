class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:chat_group_id])
    @groups = current_user.groups
    @members = @group.group_members
    @message = Message.new
  end

  def create
    @group = Group.find(params[:chat_group_id])
    Message.create(body: create_params[:body], user_id: current_user.id, group_id: @group.id)
    redirect_to chat_group_messages_path and return
  end

  private
  def create_params
    params.require(:message).permit(:body)
  end
end
