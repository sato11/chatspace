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
    let(:user) { create(:user) }
    subject { group.check_member }
    context 'when the group has any member' do
      let(:group) { create(:group, { user_ids: @group_attrs[:user_ids] }) }
      it 'returns true' do
        @group_attrs = attributes_for(:group, user_ids: [])
        @group_attrs[:user_ids] << user.id.to_s
        is_expected.to eq true
      end
    end

    context 'when the group has no member' do
      let(:group) { create(:group) }
      it 'returns false' do
        is_expected.to eq false
      end
    end
  end
end
