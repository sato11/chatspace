class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  mount_uploader :image, ImageUploader

  validate :body_or_image

  def time
    created_at.strftime('%F %T')
  end

  def message_content
    image? ? '画像が送信されました' : body
  end

  private

  def body_or_image
    errors.add(:message, 'メッセージが投稿されませんでした') unless body? || image?
  end
end
