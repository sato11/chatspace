class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :group_members
  has_many :groups, through: :group_members

  validates :name, presence: true

  def sorted_groups
    groups.sort_by do |group|
      if group.messages.any?
        group.messages.last.created_at
      else
        group.created_at
      end
    end.reverse!
  end
end
