class ChatGroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.name.present? && @group.group_members.any?
      @group.save
      redirect_to :root, notice: 'グループが作成されました' and return
    else
      redirect_to new_chat_group_path, alert: 'グループが作成されませんでした' and return
    end
  end

  def edit
  end

  def update
  end

  private
  def create_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
