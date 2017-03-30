class MessagesController < ApplicationController
  before_action :set_group, :set_groups, :set_members, :set_message, :set_messages

  def index
    respond_to do |format|
      format.html
      format.json do
        @messages = @group.messages.where('id > ?', params[:last_message_id])
      end
    end
  end

  def create
    @message = Message.new(create_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: 'メッセージが投稿されました' }
        format.json
      end
    else
      flash.now[:alert] = 'メッセージが投稿されませんでした'
      render action: :index
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_groups
    @groups = current_user.sorted_groups
  end

  def set_members
    @members = @group.group_members
  end

  def set_message
    @message = Message.new
  end

  def set_messages
    @messages = Message.includes(:user).where(group_id: @group.id)
  end

  def create_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: @group.id)
  end
end
