# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tudor = House.create(address: '36283 Tudor pl.')
whipple = House.create(address: '32727 Red Maple st.')

sam  = Person.create(name: "Sam", house_id: tudor.id)
lucy = Person.create(name: "Lucy", house_id: whipple.id)