FactoryGirl.define do
  
  TEN_PM_TOMORROW_RAW = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day + 2, 8, 0, 0, '+10')
  ELEVEN_PM_TOMORROW_RAW = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day + 2, 9, 0, 0, '+10')
  TEN_PM_YESTERDAY_RAW = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day - 2, 8, 0, 0, '+10')
  ELEVEN_PM_YESTERDAY_RAW = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day - 2, 9, 0, 0, '+10')
  
  factory :raw_program do
    title "Some title"
    subtitle "Some subtitle"
    category "The category"
    description "A show"
    start_datetime TEN_PM_TOMORROW_RAW
    end_datetime ELEVEN_PM_TOMORROW_RAW
    region_name "Some region"
    channel_xmltv_id "channel.free.au"   
  end
  
  factory :valid_raw_program, parent: :raw_program do |f|
    f.region_name "Brisbane"
    f.channel_xmltv_id "seven.free.au"   
  end
  
  factory :tennis_raw_program, parent: :valid_raw_program do |f|
    f.category "Tennis"  
  end
  
  factory :cricket_raw_program, parent: :valid_raw_program do |f|
    f.category "Cricket"  
  end
  
  factory :other_sport_raw_program, parent: :valid_raw_program do |f|
    f.category "Sport"  
  end
  
  factory :news_raw_program, parent: :valid_raw_program do |f|
    f.category "Sport/News"  
  end
  
  factory :non_sport_raw_program, parent: :valid_raw_program do |f|
    f.category "Movie"  
  end
  
  factory :terminator_keyword_raw_program, parent: :valid_raw_program do |f|
    f.category "Cricket"
    f.title "Terminator"
  end
  
  factory :historic_raw_program, parent: :valid_raw_program do |f|
    f.start_datetime TEN_PM_YESTERDAY_RAW
    f.end_datetime ELEVEN_PM_YESTERDAY_RAW
  end
  
  
end
