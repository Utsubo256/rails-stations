class Movie < ApplicationRecord
  validates :name, presence: true, length: { maximum: 160 }, uniqueness: true
  validates :year, presence: true, length: { maximum: 45 }
  validates :description, presence: true
  validates :image_url, presence: true, length: { maximum: 150 }
  validates :is_showing, presence: true
end
