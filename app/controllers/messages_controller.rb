class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:chat_group_id])
    @groups = current_user.groups
    @members = @group.group_members
    @message = Message.new
  end

  def create
    @message = Message.create(create_params)
  end

  private
  def create_params
    params.require(:message).permit(:body)
  end
end
