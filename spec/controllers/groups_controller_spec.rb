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
end
