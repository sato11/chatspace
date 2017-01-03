require 'rails_helper'
describe Group do
  describe '#create' do
    it 'is invalid without a name' do
      group = build(:group, name: "")
      group.valid?
      expect(group.errors[:name]).to include("を入力してください。")
    end

    it 'is valid with a name' do
      group = build(:group)
      group.valid?
      expect(group).to be_valid
    end
  end

  describe 'check_member' do
  end
end
