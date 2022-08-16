# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  VALID_NAME_REGEX = /\A[^0-9`!@#$%\^&*+_=]+\z/.freeze
  VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/.freeze
  validates :user_name, presence: true, length: { minimum: 3, maximum: 100 }, format: { with: VALID_NAME_REGEX }
  validates :email, presence: true, length: { minimum: 10, maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX, message: 'must be a valid email address' }, uniqueness: { case_senitive: false }
  validates :password, presence: true, length: { minimum: 7, maximum: 255 }
end
