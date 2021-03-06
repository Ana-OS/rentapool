class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pool
  validates :end_date, presence: true
  validates :start_date, presence: true, date: { after_or_equal_to: Proc.new { Date.today }, message: "must be at least #{(Date.today ).to_s}" }
  validate :end_date_is_after_start_date

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
    end
    if end_date == start_date
      errors.add(:end_date, "cannot be the same as start date")
    end
  end

   # validate :overlapping

  private

  # def overlapping
  #   if Booking.where('? <  end_date and ? > start_date', self.start_date, self.end_date).any?
  #     errors.add(:end_date, 'it overlaps another')
  #   end
  # end
end
