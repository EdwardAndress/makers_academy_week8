# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all
Review.destroy_all


kfc = Restaurant.create(name: 'KFC', cuisine: 'fast food')
kfc.reviews.create(comments: 'terrible', rating: 1)
kfc.reviews.create(comments: 'OK', rating: 3)
kfc.reviews.create(comments: 'great', rating: 5)
kfc.reviews.create(comments: 'good', rating: 4)

wimpy = Restaurant.create(name: 'Wimpy', cuisine: 'fast food')
wimpy.reviews.create(comments: 'terrible', rating: 1)
wimpy.reviews.create(comments: 'OK', rating: 3)
wimpy.reviews.create(comments: 'great', rating: 5)
wimpy.reviews.create(comments: 'good', rating: 4)

little_chef = Restaurant.create(name: 'Little Chef', cuisine: 'terrible')
little_chef.reviews.create(comments: 'terrible', rating: 1)
little_chef.reviews.create(comments: 'OK', rating: 3)
little_chef.reviews.create(comments: 'great', rating: 5)
little_chef.reviews.create(comments: 'good', rating: 4)