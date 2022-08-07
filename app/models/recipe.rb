class Recipe < ApplicationRecord
  has_many :favourites
  validates :title, presence: true
  validates :instructions, presence: true
end
