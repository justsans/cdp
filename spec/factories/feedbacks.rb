# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    user_id 1
    date "2014-07-21"
    project "MyString"
    from_user "MyString"
    category "MyString"
    message "MyString"
    action_plan "MyString"
  end
end
