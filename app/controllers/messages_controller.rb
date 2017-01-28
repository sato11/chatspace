class MessagesController < ApplicationController
  before_action :set_variables

  def index; end

  def create
    message = Message.new(create_params)
    if message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: 'メッセージが投稿されました' }
        format.json { render json: message }
      end
    else
      flash.now[:alert] = 'メッセージが投稿されませんでした'
      render action: :index
    end
  end

  private
  def set_variables
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @members = @group.group_members
    @message = Message.new
    @messages = Message.includes(:user).where(group_id: @group.id)
  end

  def create_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: @group.id)
  end
end
