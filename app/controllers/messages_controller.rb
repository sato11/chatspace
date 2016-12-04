class MessagesController < ApplicationController
  before_action :set_group

  def index
    @groups = current_user.groups
    @members = @group.group_members
    @message = Message.new
    @messages = Message.where(group_id: @group.id)
  end

  def create
    Message.create(create_params)
    redirect_to group_messages_path and return
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def create_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: @group.id)
  end
end
