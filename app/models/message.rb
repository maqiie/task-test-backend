class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'

  validates :chatroom, presence: true
  validates :user, presence: true
  validates :sender, presence: true
  validates :content, presence: true
end
