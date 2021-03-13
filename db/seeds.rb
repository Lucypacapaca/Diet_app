# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Food.create!(
    cook_id: 1,
    name: "家二郎",
    protein: 20,
    fat:50,
    carbon_hydrate: 200,
    kcal: 1330,
    amount: 1
  )
  
  Food.create!(
    cook_id: 2,
    name: "きのこの山",
    protein: 6.3,
    fat:26.7,
    carbon_hydrate: 39.4,
    kcal: 423,
    amount: 74
  )
  
  Food.create!(
    cook_id: 3,
    name: "たけのこの里",
    protein: 5.5,
    fat:22.8,
    carbon_hydrate: 38.9,
    kcal: 383,
    amount: 70
  )