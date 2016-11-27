require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without name" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください。")
    end

    it "is valid with name, email, password and password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end
