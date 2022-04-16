# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  name: "k",
  email: "a@aa",
  password: "000000"
  )
User.create!(
  [
    {
      name: "a",
      point: "10",
      rank_status: "4",
      is_paid: "false",
      email: "a@a",
      password: "000000"
    },
    {
      name: "b",
      point: "1",
      rank_status: "1",
      is_paid: "false",
      email: "b@b",
      password: "000000"
    }
  ]
)

Nutrient.create!(
    [
      {
        id: 1,
        name: "タンパク質",
        nutritional_value: "13"
      },
      {
        id: 2,
        name: "ビタミン",
        nutritional_value: "1"
      },
      {
        id: 3,
        name: "ミネラル",
        nutritional_value: "1"
      },
      {
        id: 4,
        name: "炭水化物",
        nutritional_value: "50"
      },
      {
        id: 5,
        name: "脂質",
        nutritional_value: "20"
      }
    ]
  )

Ingredient.create!(
    [
      {
        name: "牛乳"
      },
      # {
      #   name: "にんじん"
      # },
      # {
      #   name: "じゃがいも"
      # },
      {
        name: "魚"
      },
      {
        name: "豆製品"
      },
      {
        name: "卵"
      },
      {
        name: "肉"
      },
      {
        name: "米"
      },
      {
        name: "パン"
      },
      {
        name: "麺類"
      },
      {
        name: "野菜"
      },
      {
        name: "きのこ"
      },
      {
        name: "ヨーグルト"
      },
      {
        name: "チーズ"
      },
      {
        name: "果物"
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
