class Post < ApplicationRecord
  belongs_to :user
  validates :post_type, :start_time, :end_time, :spaces, :from_city, :to_city, presence: true

  def self_destroy
    has_expired = self.end_time - Time.now
    if has_expired <= 0
      self.destroy
    else
      # return hours and minutes left
      hours = (has_expired / 1.hour).to_i
      minutes = (((has_expired) % 1.hour) / 1.minute).to_i
      return "#{hours - 1} часа и #{minutes} минути"
    end
  end

  def mesta
    if self.spaces == 1
      return "1 место"
    else
      return "#{self.spaces} места"
    end
  end

  def start_day
    case self.start_time.strftime('%A')
    when 'Monday'
      return 'Понеделник'
    when 'Tuesday'
      return 'Вторник'
    when 'Wednesday'
      return 'Среда'
    when 'Thursday'
      return 'Четврток'
    when 'Friday'
      return 'Петок'
    when 'Saturday'
      return 'Сабота'
    when 'Sunday'
      return 'Недела'
    end
  end

  def end_day
    case self.end_time.strftime('%A')
    when 'Monday'
      return 'Понеделник'
    when 'Tuesday'
      return 'Вторник'
    when 'Wednesday'
      return 'Среда'
    when 'Thursday'
      return 'Четврток'
    when 'Friday'
      return 'Петок'
    when 'Saturday'
      return 'Сабота'
    when 'Sunday'
      return 'Недела'
    end
  end

  def od_do
    if self.start_time.strftime('%A') == self.end_time.strftime('%A')
      return "за #{self.start_day} од #{self.start_time.strftime('%H:%M')} до #{self.end_time.strftime('%H:%M')}"
    else
      return "за #{self.start_day} од #{self.start_time.strftime('%H:%M')}, до #{self.end_day} #{self.end_time.strftime('%H:%M')}"
    end
  end

  def minutes_ago
    has_expired = Time.now - self.created_at
    hours = (has_expired / 1.hour).to_i
    minutes = (((has_expired) % 1.hour) / 1.minute).to_i
    if hours == 0
      return "Пред #{minutes} минути"
    else
      if hours == 1
      return "Пред #{hours} час и #{minutes} минути"
      else
        return "Пред #{hours} часа и #{minutes} минути"
      end
    end
  end

end
