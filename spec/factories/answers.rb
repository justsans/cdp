# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    annual_summary_report_id 1
    question_id 1
    answer "MyString"
    question "MyString"
    section_id 1
  end
end
