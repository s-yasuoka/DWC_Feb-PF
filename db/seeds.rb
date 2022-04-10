# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "a",
  point: "10",
  rank_status: "3",
  is_paid: "false",
  email: "a@a",
  password: "000000"
)

Nutrient.create!(
  name: "カルシウム",
  nutritional_value: "5"
  )

Ingredient.create!(
    [
      {
        name: "牛乳"
      },
      {
        name: "にんじん"
      },
      {
        name: "じゃがいも"
      }
    ]
  )

IngredientNutrient.create!(
  nutrient_id: "1",
  ingredient_id: "1"
  )


MenuIngredient.create!(
  menu_id: "1",
  ingredient_id: "1"
  )

Intake.create!(
  user_id: "1",
  menu_name: "シチュー",
  status: "breakfast",
  start_time: "2022-04-05"
  )
