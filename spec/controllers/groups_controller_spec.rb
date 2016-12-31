require 'rails_helper'

describe GroupsController do
  describe "GET index" do
    login_user
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
