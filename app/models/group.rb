class Group < ApplicationRecord
  has_many :messages
  has_many :group_members
  has_many :users, through: :group_members

  validates :name, presence: true
end
