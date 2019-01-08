# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(name: 'Ben')

category = Category.create!([
                              { title: 'Cars' },
                              { title: 'Sport' },
                              { title: 'Food' }
                            ])

sport_test1 = Test.create!(title: 'Famous athlets', level: 2, category_id: category[1].id)
sport_test2 = Test.create!(title: 'Sport history', level: 1, category_id: category[1].id)
cars_test1 = Test.create!(title: 'Cars history', level: 1, category_id: category[0].id)
cars_test2 = Test.create!(title: "Car's Inner Mechanics", level: 0, category_id: category[0].id)
food_test1 = Test.create!(title: 'Weird food', level: 2, category_id: category[2].id)

questions = Question.create!([
                               { body: 'Best FIFA 2018 player', test_id: sport_test1.id },
                               { body: 'Who invented golf', test_id: sport_test2.id },
                               { body: 'Who designed an internal combustion engine', test_id: cars_test1.id },
                               { body: 'The foot pedal that makes the car go faster', test_id: sport_test2.id },
                               { body: 'Famous French dessert', test_id: food_test1.id }
                             ])

answers = Answer.create!([
                           { body: 'Luka Modric', correct: true, question_id: questions[0].id },
                           { body: 'Leo Messi', correct: false, question_id: questions[0].id },
                           { body: 'Shepherds', correct: true, question_id: questions[1].id },
                           { body: 'Fishman', correct: false, question_id: questions[1].id },
                           { body: 'Christian Huygens', correct: true, question_id: questions[2].id },
                           { body: 'Haiseberg', correct: false, question_id: questions[2].id },
                           { body: 'Accelerator', correct: true, question_id: questions[3].id },
                           { body: 'Brake', correct: false, question_id: questions[3].id },
                           { body: 'Madeleine', correct: true, question_id: questions[4].id },
                           { body: 'Pancakes', correct: true, question_id: questions[4].id }
                         ])

results = Result.create!([
                           { user_id: user.id, test_id: sport_test1.id },
                           { user_id: user.id, test_id: food_test1.id }
                         ])
