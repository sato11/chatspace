class Group < ApplicationRecord
  has_many :messages
  has_many :group_members
  has_many :users, through: :group_members

  validates :name, presence: true

  def check_member
    users.any?
  end

  def latest_message
    messages.last ? messages.last.show_body_or_image : 'まだメッセージはありません'
  end
end
