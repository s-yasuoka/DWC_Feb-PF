class Intake < ApplicationRecord

  belongs_to :user
  belongs_to :menu

  has_many_attached :image

  enum status: { breakfast: 1, lunch: 2, dinner: 3, snack: 4}
end
