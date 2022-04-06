class Menu < ApplicationRecord

  has_many :intakes
  has_many :ingredients, through: :menu_ingredients
  has_many :menu_ingredients, dependent: :destroy
end
