# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    question "MyString"
    section_id 1
    active false
  end
end
