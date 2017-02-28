class Group < ApplicationRecord
  has_many :messages
  has_many :group_members
  has_many :users, through: :group_members

  validates :name, presence: true

  def check_member
    users.any?
  end

  def check_content
    messages.any? ? messages.last.message_content : 'まだメッセージがありません'
  end

  def check_time
    messages.any? ? messages.last.sidebar_time : sidebar_time
  end
end
