
class User < ActiveRecord::Base
  has_one_attached :image


  has_many :reminders

  has_many :chatrooms_as_user1, class_name: 'Chatroom', foreign_key: 'user1_id'
  has_many :chatrooms_as_user2, class_name: 'Chatroom', foreign_key: 'user2_id'

  has_many :reminder_users
  has_many :tagged_reminders, through: :reminder_users, source: :reminder
  has_many :notes
  has_many :notifications
  has_many :invitations
  has_many :invited_reminders, through: :invitations, source: :reminder


  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  enum role: [:user, :admin] # Define roles as enum


  def self.search(query)
    where("email LIKE ? OR username LIKE ?", "%#{query}%", "%#{query}%")
  end
  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: 'sender_id'

  # Association for received friend requests
 
 
 
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: 'receiver_id'
  def as_json(options = {})
    super(options.merge({ only: [:id, :email, :username, :name, :nickname, :birthday, :role, :uid], methods: [:image_url] }))
  end

  def image_url
    image.attached? ? Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true) : nil
  end

end


