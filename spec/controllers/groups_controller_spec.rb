require 'rails_helper'

describe GroupsController do
  describe 'GET #index' do
    login_user
    it "has @groups as an array" do
      get :index
      expect(assigns(:groups)).to match_array([])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    login_user
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    login_user
    it 'assigns requested value to @group' do
      group = create(:group)
      get :edit, params: { id: group }
      expect(assigns(:group)).to eq(group)
    end

    it 'renders the :edit template' do
      group = create(:group)
      get :edit, params: { id: group }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    login_user
    context 'when new group has any members' do
      before do
        @group = attributes_for(:group, user_ids: [])
        @group[:user_ids] << @user.id.to_s
      end

      it 'saves the new group in the database' do
        expect{
          post :create, params: { group: { name: @group[:name], user_ids: @group[:user_ids] } }
        }.to change(Group, :count).by(1)
      end

      it 'redirects to root path' do
        post :create, params: { group: { name: @group[:name], user_ids: @group[:user_ids] } }
        expect(response).to redirect_to root_path
      end

      it 'sets flash[:notice]' do
        post :create, params: { group: { name: @group[:name], user_ids: @group[:user_ids] } }
        expect(flash[:notice]).to be_present
      end
    end

    context 'when new group has no member' do
      before do
        @group = attributes_for(:group)
      end

      it 'does not save the new group in the database' do
        expect{
          post :create, params: { group: { name: @group[:name] } }
        }.not_to change(Group, :count)
      end

      it 'redirects to new group path' do
        post :create, params: { group: { name: @group[:name] } }
        expect(response).to redirect_to new_group_path
      end

      it 'sets flash[:alert]' do
        post :create, params: { group: { name: @group[:name] } }
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe 'PUT #update' do
    login_user
    context 'when edited group has any members' do
      before do
        @group = attributes_for(:group, user_ids: [])
        @group[:user_ids] << @user.id.to_s
        @first_group = create(:group, user_ids: @group[:user_ids])
      end

      it 'redirects to root path' do
        put :update, params: { group: { name: @group[:name], user_ids: @group[:user_ids] }, id: @first_group.id }
        expect(response).to redirect_to root_path
      end

      it 'sets flash[:notice]' do
        put :update, params: { group: { name: @group[:name], user_ids: @group[:user_ids] }, id: @first_group.id }
        expect(flash[:notice]).to be_present
      end
    end

    context 'when edited group has no member' do
      before do
        @group = attributes_for(:group)
        @first_group = create(:group)
        put :update, params: { group: { name: @group[:name] }, id: @first_group.id }
      end

      it 'redirects to edit group path' do
        expect(response).to redirect_to edit_group_path
      end

      it 'sets flash[:alert]' do
        expect(flash[:alert]).to be_present
      end
    end
  end
end
