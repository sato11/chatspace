# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :text(65535)
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  group_id   :integer
#
# Indexes
#
#  index_messages_on_group_id  (group_id)
#  index_messages_on_user_id   (user_id)
#

require 'rails_helper'
describe Message do
  describe 'mount_uploader' do
    it 'attaches an image to the message' do
      message = build(:message)
      expect(message.image).not_to be_nil
    end
  end

  describe '#create' do
    it 'is valid with body and image' do
      message = build(:message)
      expect(message).to be_valid
    end

    it 'is valid with only body' do
      message = build(:message, image: '')
      expect(message).to be_valid
    end

    it 'is valid with only image' do
      message = build(:message, body: '')
      expect(message).to be_valid
    end

    it 'is invalid without both body and image' do
      message = build(:message, body: '', image: '')
      message.valid?
      expect(message.errors[:message]).to include 'メッセージが投稿されませんでした'
    end
  end

  describe '#time' do
    it "trims the message's created_at parameter with strftime" do
      message = create(:message)
      expect(message.time).to eq message.created_at.strftime('%F %T')
    end
  end

  describe '#message_content' do
    subject { @message.message_content }

    context 'when the message has an image' do
      it 'announces that the image is sent' do
        @message = create(:message)
        is_expected.to eq '画像が送信されました'
      end
    end

    context 'when the message has no image' do
      it "returns the message's body" do
        @message = create(:message, image: '')
        is_expected.to eq @message.body
      end
    end
  end
end
