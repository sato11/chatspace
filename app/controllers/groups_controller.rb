class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  before_action :pass_users_to_json, only: [:new, :edit]
  before_action :set_members, only: [:new, :create]

  def index
    @groups = current_user.groups
  end

  def new
  end

  def create
    @group = Group.new(group_params)
    if @group.check_member
      @group.save
      redirect_to :root, notice: 'グループが作成されました' and return
    else
      flash[:alert] = 'グループが作成されませんでした'
      render action: :new
    end
  end

  def edit
    @members = @group.users
  end

  def update
    group = Group.new(group_params)
    if group.check_member
      @group.update(group_params)
      redirect_to :root, notice: 'グループが更新されました' and return
    else
      redirect_to edit_group_path, alert: 'グループが更新されませんでした' and return
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def set_members
    @group = Group.new
    @group.users << current_user
    @members = @group.users
  end

  def pass_users_to_json
    users = User.all
    respond_to do |format|
      format.html
      format.json { render json: users }
    end
  end

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
