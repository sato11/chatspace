# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
  include TimeFormatNormalizer

  has_many :messages
  has_many :group_members
  has_many :users, through: :group_members

  validates :name, presence: true

  def check_member
    users.any?
  end

  def check_content
    messages.last&.message_content || 'まだメッセージがありません'
  end

  # display the time the latest message was posted if the group has any message
  # otherwise display the time the group was created
  def check_time
    messages.last&.sidebar_time || sidebar_time
  end
end
