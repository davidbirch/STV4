FactoryGirl.define do
  
  # already defined in raw_programs.rb  
  TEN_PM_TOMORROW_PROG = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day + 1, 8, 0, 0, '+10')
  ELEVEN_PM_TOMORROW_PROG = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day + 1, 9, 0, 0, '+10')
  TEN_PM_YESTERDAY_PROG = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day - 1, 8, 0, 0, '+10')
  ELEVEN_PM_YESTERDAY_PROG = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day - 1, 9, 0, 0, '+10')
  
  factory :program do
    title "Some title"
    subtitle "Some subtitle"
    category "The category"
    description "A show"
    start_datetime TEN_PM_TOMORROW_PROG
    end_datetime ELEVEN_PM_TOMORROW_PROG
    region
    sport
    channel
  end
   
  factory :valid_program, parent: :program do |f|
    f.title "AFL Grand Final"
    f.subtitle "In September"
    f.category "Sport/AFL"
  end
   
  factory :historic_program, parent: :valid_program do |f|
    f.start_datetime TEN_PM_YESTERDAY_PROG
    f.end_datetime ELEVEN_PM_YESTERDAY_PROG
  end
  
end
