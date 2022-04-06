class MenuIngredient < ApplicationRecord

  belongs_to :menus
  belongs_to :ingredients
end
