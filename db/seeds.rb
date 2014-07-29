# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

Question.create(id: 1, question: "What is expected of me, at the highest level, as a TWer? (organizational level expectations)", section_id: 1, active: true)
Question.create(id: 2, question: "What is expected of me on my current project/in my current role?   (project/role level expectations)", section_id: 1, active: true)
Question.create(id: 3,question: "What is expected of me individually?", section_id: 1, active: true)

Question.create(id: 4,question: "What are my long-term career aspirations (3-5 years)?", section_id: 2, active: true)
Question.create(id: 5,question: "What are my short-term career aspirations (2 year)?", section_id: 2, active: true)

Question.create(id: 6,question: "What gaps might I need to fill in order to meet my aspirations?", section_id: 3, active: true)
Question.create(id: 7,question: "What areas do I need to focus on in the next 6 - 12 months?", section_id: 3, active: true)

Question.create(id: 8,question: "Provide an overview of your areas of Focus for the last year, summary of your progress and comment on notable challenges along the way.", section_id: 4, active: true)


