class Nutrient < ApplicationRecord

  has_many :ingredients,  through: :ingredient_nutrients
  has_many :ingredient_nutrients, dependent: :destroy

end
