require 'rails_helper'
describe Group do
  describe '#create' do
    context 'when a group does not have a name' do
      it 'is invalid' do
        group = build(:group, name: '')
        group.valid?
        expect(group.errors[:name]).to include('を入力してください。')
      end
    end

    context 'when a group has a name' do
      it 'is valid' do
        group = build(:group)
        group.valid?
        expect(group).to be_valid
      end
    end
  end

  describe '#check_member' do
    let(:user) { create(:user) }
    subject { group.check_member }

    context 'when the group has any member' do
      let(:group) { create(:group, user_ids: @group_attrs[:user_ids]) }
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

  describe '#check_content' do
    let(:group) { create(:group) }
    subject { group.check_content }

    context 'when the group has a message' do
      context 'when the message has an image' do
        it 'announces that the image is sent' do
          @message = create(:message, group: group)
          is_expected.to eq '画像が送信されました'
        end
      end

      context 'when the message has no image' do
        it "returns the message's body" do
          @message = create(:message, image: '', group: group)
          is_expected.to eq @message.body
        end
      end
    end

    context 'when the group has no message' do
      it 'points out that the group has no messages yet' do
        is_expected.to eq 'まだメッセージがありません'
      end
    end
  end

  describe '#check_time' do
    let(:group) { create(:group) }
    subject { group.check_time }

    context 'when the group has a message' do
      it 'returns the time the message is created' do
        message = create(:message, group: group)
        is_expected.to eq message.created_at.strftime('%T')
      end
    end

    context 'when the group has no message' do
      it 'returns the time the group is created' do
        is_expected.to eq group.created_at.strftime('%T')
      end
    end
  end
end
