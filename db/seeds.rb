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

#Goal Reflection
Question.create(id: 8,question: "Provide an overview of your areas of Focus for the last year, summary of your progress and comment on notable challenges along the way.", section_id: 4, active: true)

#Team Reflection
Question.create(id: 9,question: "How would TWers with whom you've worked closely describe your skills in relation to your primary role", section_id: 5, active: true)
Question.create(id: 10,question: "How would TWers with whom you've worked closely describe your skills your ability/versatility to effectively fill other roles/needs on the team?", section_id: 5, active: true)


#Personal Growth
Question.create(id: 11,question: "What would your market and your teams need to know about you in order to leverage you well and help you grow?", section_id: 6, active: true)
Question.create(id: 12,question: "What are your strengths [Note: Consider doing the Strengths Finders assessment, or some other.]", section_id: 6, active: true)
Question.create(id: 13,question: "What areas are you working to improve where continual feedback, coaching and support would be very helpful? ", section_id: 6, active: true)

#Feedback
Question.create(id: 14,question: "Highlight some of the feedback patterns you've discovered this year?", section_id: 7, active: true)
Question.create(id: 15,question: "How have you changed (or plan on changing) as a result? ", section_id: 7, active: true)
Question.create(id: 16,question: "If you polled all of the TWers you've worked with over the last year, how do you think they would rate you on your efforts to provide both positive and constructive feedback on a consistent basis? Please explain. (Use a 1-10 scale, 1=lowest rating and 10=highest rating) ", section_id: 7, active: true)


#Coaching Skills
Question.create(id: 17,question: "Reflecting on the times you've spent pairing/working with someone less experienced, how would they describe you as a coach/mentor? ", section_id: 8, active: true)
Question.create(id: 18,question: "Reflecting on the times you've spent pairing with some more experienced, how would they describe you as a coachee/mentee?", section_id: 8, active: true)

#Consulting Skills
Question.create(id: 19,question: "In your current engagement/role, if you put yourself in your customer's shoes, how would they describe your consulting and influencing skills?  ", section_id: 9, active: true)
Question.create(id: 20,question: "In what types of consulting environment are you comfortable and not so comfortable?", section_id: 9, active: true)


#Engagement
Question.create(id: 21,question: "On that same 1-10 scale above, how would you rate your overall engagement and activity within TW? (e.g., project, external market, home office community, practice, recruiiting, SEJ, etc)?  ", section_id: 10, active: true)
Question.create(id: 22,question: "Please explain. If you didn’t rate yourself as a 10, what would it take to get you there?", section_id: 10, active: true)

#Personal Journey
#Food for thought around your personal journey on the topic of Social and Economic Justice (there is no 'right' answer, of course!). Take a look at these posts: https://my.thoughtworks.com/docs/DOC-23358
#https://my.thoughtworks.com/docs/DOC-23243

Question.create(id: 23,question: "What do you think about these communications?", section_id: 11, active: true)
Question.create(id: 24,question: "Are they helpful?", section_id: 11, active: true)
Question.create(id: 25,question: "How has your view of what P3 means at TW changed?", section_id: 11, active: true)
Question.create(id: 26,question: "How would you like to get involved in 2014?", section_id: 11, active: true)


#Looking forward

Question.create(id: 27,question: "What are your areas of Focus for next year?  Importantly, what would you consider to be the immediate next step in your ThoughtWorks journey?", section_id: 12, active: true)
Question.create(id: 28,question: "What gaps do you need to address in order to get there and/or what roadblocks are in your way of doing so? ", section_id: 12, active: true)
Question.create(id: 29,question: "What support if any do you need from TW?", section_id: 12, active: true)


#Discussion Topics
Question.create(id: 30,question: "List any topics you would like us to come prepared to discuss. Any feedback for your market or TW?", section_id: 13, active: true)





