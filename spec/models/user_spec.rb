# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'
describe User do
  describe '#create' do
    it 'is invalid without name' do
      user = build(:user, name: '')
      user.valid?
      expect(user.errors[:name]).to include('を入力してください。')
    end

    it 'is valid with name, email, password and password_confirmation' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is invalid without an email' do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include('を入力してください。')
    end

    it 'is invalid without a password' do
      user = build(:user, password: '')
      user.valid?
      expect(user.errors[:password]).to include('を入力してください。')
    end

    it 'is invalid without a password_confirmation' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません。')
    end

    it 'is invalid when an email is already taken' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('はすでに存在します。')
    end

    it 'is valid when password is made up of six characters' do
      user = build(:user, password: '000000', password_confirmation: '000000')
      expect(user).to be_valid
    end

    it 'is invalid when password is less than six characters' do
      user = build(:user, password: '00000', password_confirmation: '00000')
      user.valid?
      expect(user.errors[:password]).to include('は6文字以上で入力してください。')
    end
  end
end
