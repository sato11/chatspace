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

class Message < ApplicationRecord
  include TimeFormatNormalizer

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
