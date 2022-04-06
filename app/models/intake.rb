class Intake < ApplicationRecord

  belongs_to :user
  belongs_to :menu

   has_many_attached :image
end
