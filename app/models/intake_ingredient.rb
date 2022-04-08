class IntakeIngredient < ApplicationRecord

  belongs_to :intake
  belongs_to :ingredient
end
