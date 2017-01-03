require 'rails_helper'

describe GroupsController do
  let(:group) { create(:group) }
  let(:membered_group) { create(:group, { user_ids: @group[:user_ids] }) }
  context 'when user is signed in' do
    login_user

    describe 'GET #index' do
      before do
        get :index
      end

      it "has @groups as an array" do
        expect(assigns(:groups)).to match_array([])
      end

      it 'renders the :index template' do
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      it 'renders the :new template' do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      before do
        get :edit, params: { id: group }
      end

      it 'assigns requested value to @group' do
        expect(assigns(:group)).to eq(group)
      end

      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end

    describe 'POST #create' do
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
      context 'when edited group has any members' do
        before do
          @group = attributes_for(:group, user_ids: [])
          @group[:user_ids] << @user.id.to_s
          put :update, params: { group: { name: @group[:name], user_ids: @group[:user_ids] }, id: membered_group.id }
        end

        it 'redirects to root path' do
          expect(response).to redirect_to root_path
        end

        it 'sets flash[:notice]' do
          expect(flash[:notice]).to be_present
        end
      end

      context 'when edited group has no member' do
        before do
          @group = attributes_for(:group)
          put :update, params: { group: { name: @group[:name] }, id: group.id }
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

  context 'when user is not signed in' do
    describe 'GET #index' do
      it 'redirects to new user session path' do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #new' do
      it 'redirects to new user session path' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do
      it 'redirects to new user session path' do
        get :edit, params: { id: group }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'POST #create' do
      it 'redirects to new user session path' do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PUT #update' do
      it 'redirects to new user session path' do
        put :update, params: { id: group }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
