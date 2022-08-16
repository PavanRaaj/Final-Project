# frozen_string_literal: true

class CarsList < ApplicationRecord
  has_one_attached :car_image

  VALID_NAME_REGEX = /\A[^0-9`!@#$%\^&*+_=]+\z/.freeze
  validates :owner_mobile_number, presence: true, length: { minimum: 10, maximum: 10 }
  validates :car_registration_number, presence: true, uniqueness: { case_senitive: false }
  validates :car_name, presence: true, length: { minimum: 3, maximum: 100 }, format: { with: VALID_NAME_REGEX }
  validates :per_day_price, presence: true
  validates :car_owner_name, presence: true, length: { minimum: 3, maximum: 100 }, format: { with: VALID_NAME_REGEX }
end
