class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:chat_group_id])
    @groups = current_user.groups
    @members = @group.group_members
  end

  def create
  end
end
