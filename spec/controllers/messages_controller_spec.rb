require 'rails_helper'

describe MessagesController do
  context 'when user is signed in' do
    login_user
    let(:group) { create(:group) }

    describe 'GET #index' do
      it 'has @groups as an array' do
        get :index, params: { group_id: group }
        expect(assigns(:groups)).to match_array []
      end
    end

    describe 'POST #create' do
    end
  end

  context 'when user is not signed in' do
    describe 'GET #index' do
    end

    describe 'POST #create' do
    end
  end
end
