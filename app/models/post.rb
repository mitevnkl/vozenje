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
      return "#{hours} hours and #{minutes} minutes"
    end
  end

  def mesta
    if self.spaces == 1
      return "1 mesto"
    else
      return "#{self.spaces} mesta"
    end
  end

  def od_do
    if self.start_time.strftime('%A') == self.end_time.strftime('%A')
      return "za #{self.start_time.strftime('%A')} od #{self.start_time.strftime('%H:%M')} do #{self.end_time.strftime('%H:%M')}"
    else
      return "za #{self.start_time.strftime('%A')} od #{self.start_time.strftime('%H:%M')}, do #{self.end_time.strftime('%A')} #{self.end_time.strftime('%H:%M')}"
    end
  end

  def minutes_ago
    has_expired = Time.now - self.created_at
    hours = (has_expired / 1.hour).to_i
    minutes = (((has_expired) % 1.hour) / 1.minute).to_i
    if hours == 0
      return "Posted #{minutes} minutes ago"
    else
      if hour == 1
      return "Posted #{hours} hour and #{minutes} minutes ago"
      else
        return "Posted #{hours} hours and #{minutes} minutes ago"
      end
    end
  end

  # def matches
  #   other_posts = Post.where(from_city: self.from_city, to_city: self.to_city, user: !self.user)
  #   matches = []
  #   other_posts.each do |post|
  #     matches << post
  #   end
  #   return matches
  # end
end
