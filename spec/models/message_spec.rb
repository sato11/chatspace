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
end
