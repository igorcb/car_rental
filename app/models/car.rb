# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :category, optional: false

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :rented, presence: true, if: -> { rented.nil? }
  validates :url_image, presence: true

  has_many :rents

  scope :rented, -> { where(rented: true) }
  scope :not_rented, -> { where(rented: false) } # fazer o test model
end
