FactoryGirl.define do
  
  factory :raw_program do
    title "2013 Australian Open"
    subtitle "Night 8"
    category "Live Sport, Tennis"
    description "Live coverage of the Australian Open"
    start_datetime DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day + 1, 8, 0, 0, '+10')
    end_datetime DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day + 1, 9, 0, 0, '+10')
    region_name "Brisbane"
    channel_xmltv_id "seven.free.au"
  end
  
end
