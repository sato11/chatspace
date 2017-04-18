class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :group_members
  has_many :groups, through: :group_members

  validates :name, presence: true

  # sort groups by the time the latest messaage was posted or
  # the time a group was created if it doesn't have any message yet
  def sorted_groups
    groups.includes(:messages).sort_by do |group|
      group.messages.last&.created_at || group.created_at
    end.reverse!
  end
end
