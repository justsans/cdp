# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    user_id 1
    from_user_id 1
    from_user_name "MyString"
    from_user_email "MyString"
    status_id 1
  end
end
