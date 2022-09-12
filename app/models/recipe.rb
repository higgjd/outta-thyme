class Recipe < ApplicationRecord
  has_many :favourites
  validates :title, presence: true, uniqueness: true
  validates :instructions, presence: true
end
