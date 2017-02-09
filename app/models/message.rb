class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  mount_uploader :image, ImageUploader

  validate :body_or_image

  def time
    self.created_at.strftime('%F %T')
  end

  def show_body_or_image
    body.present? ? body : '画像が送信されました'
  end

  private

  def body_or_image
    errors.add(:message, 'メッセージが投稿されませんでした') unless body? || image?
  end
end
