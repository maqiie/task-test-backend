# class Reminder < ApplicationRecord
#   belongs_to :user, optional: true  # Remove optional: true if user_id is required

#   has_many :reminder_users, dependent: :destroy
#   has_many :users, through: :reminder_users
#   has_one :notification
#   has_one_attached :attachment
#   has_many :invitations
#   has_many :invited_users, through: :invitations, source: :user
#   has_many :tagged_users, through: :reminder_users, source: :user

#   after_create :create_notification
  
#   validates :user_id, presence: true, unless: -> { user.nil? }
#   validates :title, presence: true
#   validates :due_date, presence: true
#   validates :duration, presence: true
#   validates :repeat_interval_unit, inclusion: { in: %w(day week month) }, allow_blank: true
#   validates :repeat_interval, presence: true, allow_blank: true
#   validates :duration, presence: true # Change to allow_nil: true or remove this line if duration is optional
#   validates :title, presence: true
#   # validates :priority, inclusion: { in: %w(low medium high) }
#   validates :priority, inclusion: { in: %w(low medium high High Medium Low) }

#   validate :due_date_cannot_be_in_the_past

#   def add_user(user, relationship_category)
#     reminder_users.create(user: user, relationship_category: relationship_category)
#   end
  
#   def create_notification
#     Notification.create(user: self.user, message: "Reminder: #{self.title}")
#   end

#   def schedule
#     self.due_date.past? ? 'start' : 'future'
#   end

#   def self.search(query)
#     where("title LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%")
#   end

#   def due_date_cannot_be_in_the_past
#     errors.add(:due_date, "can't be in the past") if due_date.present? && due_date < Date.today
#   end

#   # Method to generate recurring reminders schedule
#   def recurring_schedule
#     schedule = IceCube::Schedule.new(due_date)
#     case repeat_interval_unit
#     when 'day'
#       schedule.add_recurrence_rule IceCube::Rule.daily(repeat_interval)
#     when 'week'
#       schedule.add_recurrence_rule IceCube::Rule.weekly(repeat_interval)
#     when 'month'
#       schedule.add_recurrence_rule IceCube::Rule.monthly(repeat_interval)
#     end
#     schedule
#   end
  

#   def generate_future_occurrences
#     occurrences = []
#     return occurrences if due_date.nil? || recurrence_frequency.nil? || recurrence_interval.nil?
  
#     start_date = due_date
#     interval = recurrence_interval
  
#     case recurrence_frequency
#     when 'daily'
#       10.times { |i| occurrences << start_date + i * interval.days }
#     when 'weekly'
#       10.times { |i| occurrences << start_date + i * interval.weeks }
#     when 'monthly'
#       10.times { |i| occurrences << start_date + i * interval.months }
#     when 'yearly'
#       10.times { |i| occurrences << start_date + i * interval.years }
#     else
#       return []
#     end
  
#     occurrences
#   end
  


#   scope :special_events, -> { where(is_special_event: true) }

#   # Remove attr_accessible
# end



class Reminder < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reminder_users, dependent: :destroy
  has_many :users, through: :reminder_users
  has_one :notification
  has_one_attached :attachment
  has_many :invitations
  has_many :invited_users, through: :invitations, source: :user
  has_many :tagged_users, through: :reminder_users, source: :user

  after_create :create_notification

  validates :user_id, presence: true, unless: -> { user.nil? }
  validates :title, presence: true
  validates :due_date, presence: true
  validates :duration, presence: true
  validates :recurrence_interval_unit, inclusion: { in: %w(day week month) }, allow_blank: true
  validates :recurrence_interval, presence: true, allow_blank: true
  validates :priority, inclusion: { in: %w(low medium high High Medium Low) }

  validate :due_date_cannot_be_in_the_past

  def add_user(user, relationship_category)
    reminder_users.create(user: user, relationship_category: relationship_category)
  end
  
  def create_notification
    Notification.create(user: self.user, message: "Reminder: #{self.title}")
  end

  def schedule
    self.due_date.past? ? 'start' : 'future'
  end

  def self.search(query)
    where("title LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%")
  end

  def due_date_cannot_be_in_the_past
    errors.add(:due_date, "can't be in the past") if due_date.present? && due_date < Date.today
  end

  def recurring_schedule
    schedule = IceCube::Schedule.new(due_date)
    case repeat_interval_unit
    when 'day'
      schedule.add_recurrence_rule IceCube::Rule.daily(repeat_interval)
    when 'week'
      schedule.add_recurrence_rule IceCube::Rule.weekly(repeat_interval)
    when 'month'
      schedule.add_recurrence_rule IceCube::Rule.monthly(repeat_interval)
    end
    schedule
  end
  def recurring_schedule
    schedule = IceCube::Schedule.new(due_date)
    case recurrence_interval_unit
    when 'day'
      schedule.add_recurrence_rule IceCube::Rule.daily(recurrence_interval)
    when 'week'
      schedule.add_recurrence_rule IceCube::Rule.weekly(recurrence_interval)
    when 'month'
      schedule.add_recurrence_rule IceCube::Rule.monthly(recurrence_interval)
    end
    schedule
  end
  def generate_future_occurrences
    occurrences = []
    return occurrences if due_date.nil? || recurrence_frequency.nil? || recurrence_interval.nil?
  
    start_date = due_date
    interval = recurrence_interval
  
    case recurrence_frequency
    when 'daily'
      10.times { |i| occurrences << start_date + i * interval.days }
    when 'weekly'
      10.times { |i| occurrences << start_date + i * interval.weeks }
    when 'monthly'
      10.times { |i| occurrences << start_date + i * interval.months }
    when 'yearly'
      10.times { |i| occurrences << start_date + i * interval.years }
    else
      return []
    end
  
    occurrences
  end

  scope :special_events, -> { where(is_special_event: true) }
end
