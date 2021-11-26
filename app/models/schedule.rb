class Schedule < ApplicationRecord
  
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_end_check
  validate :start_check
  
  def start_end_check
    if self.start_date != nil && self.end_date != nil
      errors.add(:end_date, 'は開始日より遅い日時を選択してください') if self.start_date > self.end_date
    end
  end
  
  def start_check
    if self.start_date != nil
      errors.add(:start_date, "は現在のより遅い日時を選択してください") if self.start_date < Date.today
    end
  end
end
