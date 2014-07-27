# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :annual_summary_report do
    user_id 1
    title "MyString"
    year 1
    status 1
  end
end
