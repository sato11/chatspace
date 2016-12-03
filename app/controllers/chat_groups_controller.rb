class ChatGroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
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
    @members = @group.group_members
  end

  def update
    if create_params[:name].present?
      if create_params[:user_ids] == [""]
        params.require(:group)[:user_ids] << current_user.id.to_s
      end
      @group.update(create_params)
      redirect_to :root, notice: 'グループが更新されました' and return
    else
      redirect_to edit_chat_group_path, alert: 'グループが更新されませんでした' and return
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def create_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
