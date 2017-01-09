class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  mount_uploader :image, ImageUploader

  validate :body_or_image

  private
  def body_or_image
    errors.add(:message, 'メッセージが投稿されませんでした') unless body? || image?
  end
end
