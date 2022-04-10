class Intake < ApplicationRecord

  belongs_to :user
  # belongs_to :menu
  has_many :intake_ingredients, dependent: :destroy
  has_many :ingredients, through: :intake_ingredients

  has_many_attached :image

  validates :menu_name, presence: true, length: { minimum: 2 }
  validates :status, presence: true
  validates :start_time, presence: true

  enum status: { breakfast: 1, lunch: 2, dinner: 3, snack: 4}

  def save_ingredient(sent_ingredients)
    current_ingredients = self.ingredients.pluck(:name) unless self.ingredients.nil?
    old_ingredients = current_ingredients - sent_ingredients
    new_ingredients = sent_ingredients - current_ingredients

    old_ingredients.each do |old|
      self.ingredients.delete Ingredient.find_by(name: old)
    end

    new_ingredients.each do |new|
      new_intake_ingredient = Ingredient.find_or_create_by(name: new)
      self.ingredients << new_intake_ingredient
    end
  end


end
