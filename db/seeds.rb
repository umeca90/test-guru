# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!([
                    { email: 'ben1@mail.net', password: 111111, first_name: 'Ben', last_name: 'Franklin' },
                    { email: 'alex1@mail.net', password: 111111, first_name: 'Alex', last_name: 'Pert' },
                    { email: 'fred1@mail.net', password: 111111, first_name: 'Fred', last_name: 'Kruger' },
                    { email: 'admin@mail.net', password: 'admin1', type: 'Admin', first_name: 'Admin', last_name: 'Admin' }
                    ])

category = Category.create!([
                              { title: 'Cars' },
                              { title: 'Sport' },
                              { title: 'Food' }
                            ])

sport_test1 = Test.create!(title: 'Famous athlets', level: 2, category_id: category[1].id, author_id: user[0].id)
sport_test2 = Test.create!(title: 'Sport history', level: 1, category_id: category[1].id, author_id: user[0].id)
cars_test1 = Test.create!(title: 'Cars history', level: 1, category_id: category[0].id, author_id: user[0].id)
cars_test2 = Test.create!(title: "Car's Inner Mechanics", level: 0, category_id: category[0].id, author_id: user[0].id)
food_test1 = Test.create!(title: 'Weird food', level: 2, category_id: category[2].id, author_id: user[0].id)

questions = Question.create!([
                               { body: 'Best FIFA 2018 player', test_id: sport_test1.id },
                               { body: 'Best NBA 2018 player', test_id: sport_test1.id },
                               { body: 'Best NHL 2018 player', test_id: sport_test1.id },
                               { body: 'USSR famous goalkeeper', test_id: sport_test1.id },
                               { body: 'Who invented golf', test_id: sport_test2.id },
                               { body: 'Who designed an internal combustion engine', test_id: cars_test1.id },
                               { body: 'The foot pedal that makes the car go faster', test_id: sport_test2.id },
                               { body: 'French dessert', test_id: sport_test2.id }
                             ])



sport_answers1 = Answer.create!([
                              { body: 'Luka Modric', correct: true, question_id: questions[0].id },
                              { body: 'Leo Messi', correct: false, question_id: questions[0].id },
                              { body: 'Ronaldo', correct: false, question_id: questions[0].id },
                              { body: 'Zidan', correct: false, question_id: questions[0].id },
                              { body: 'LeBron James', correct: true, question_id: questions[1].id },
                              { body: 'Kevin Durant', correct: false, question_id: questions[1].id },
                              { body: 'James Harden', correct: false, question_id: questions[1].id },
                              { body: 'Joel Embiid', correct: false, question_id: questions[1].id },
                              { body: 'Connor McDavid', correct: true, question_id: questions[2].id },
                              { body: 'Sidney Crosby', correct: false, question_id: questions[2].id },
                              { body: 'Evgeni Malkin', correct: false, question_id: questions[2].id },
                              { body: 'Auston Matthews', correct: false, question_id: questions[2].id },
                              { body: 'Igor Akenfeev', correct: false, question_id: questions[3].id },
                              { body: 'Lev Petrov', correct: false, question_id: questions[3].id },
                              { body: 'Lev Yashin', correct: true, question_id: questions[3].id },
                              { body: 'Kuznetsov Petr', correct: false, question_id: questions[3].id },
                              ])




answers = Answer.create!([

                           { body: 'Mikelangelo', correct: false, question_id: questions[4].id },
                           { body: 'Shepherds', correct: true, question_id: questions[4].id },
                           { body: 'Fishman', correct: false, question_id: questions[4].id },
                           { body: 'Prophet', correct: false, question_id: questions[4].id },
                           { body: 'Christian Huygens', correct: true, question_id: questions[5].id },
                           { body: 'Haiseberg', correct: false, question_id: questions[5].id },
                           { body: 'Tomas Edison', correct: false, question_id: questions[5].id },
                           { body: 'Lomonosov', correct: false, question_id: questions[5].id },
                           { body: 'Accelerator', correct: true, question_id: questions[6].id },
                           { body: 'Brake', correct: false, question_id: questions[6].id },
                           { body: 'Front window', correct: false, question_id: questions[6].id },
                           { body: 'Side window', correct: false, question_id: questions[6].id },
                           { body: 'Madeleine', correct: true, question_id: questions[7].id },
                           { body: 'Croussans', correct: false, question_id: questions[7].id },
                           { body: 'Burgers', correct: false, question_id: questions[7].id },
                           { body: 'Pancakes', correct: true, question_id: questions[7].id }
                         ])

results = TestPassage.create!([
                           { user_id: user[0].id, test_id: sport_test1.id },
                           { user_id: user[1].id, test_id: food_test1.id },
                           { user_id: user[2].id, test_id: food_test1.id }
                         ])
