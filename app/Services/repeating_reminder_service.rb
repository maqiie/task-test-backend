# app/services/repeating_reminder_service.rb
class RepeatingReminderService
    def self.schedule_next_occurrence(reminder)
      case reminder.repeat_interval_unit
      when 'daily'
        reminder.update(due_date: reminder.due_date.tomorrow)
      when 'weekly'
        reminder.update(due_date: reminder.due_date + 1.week)
      # Add more cases for other repeat_interval_units (monthly, yearly, etc.)
      end
    end
  end
  