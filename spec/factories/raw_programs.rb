# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :raw_program do
    title "MyString"
    subtitle "MyString"
    category "MyString"
    description "MyString"
    start_datetime "2013-01-21 12:00:43"
    end_datetime "2013-01-21 12:00:43"
    region_name "MyString"
    channel_xmltv_id "MyString"
  end
end
