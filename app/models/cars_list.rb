# frozen_string_literal: true

class CarsList < ApplicationRecord
  has_one_attached :car_image
end
