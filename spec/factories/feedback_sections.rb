# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback_section do
    feedback_id 1
    question "MyText"
    answer "MyText"
    rating 1
    question_type 1
    action_plan "MyText"
    category "MyText"
  end
end
