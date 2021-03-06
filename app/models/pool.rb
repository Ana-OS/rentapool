class Pool < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price_hour, presence: true
  has_one_attached :photo
  geocoded_by :address
  validates :photo, presence: true

  after_validation :geocode
  after_validation :geocode, if: :will_save_change_to_address?


end
