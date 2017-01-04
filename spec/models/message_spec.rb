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
  end
end
