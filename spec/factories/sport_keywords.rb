FactoryGirl.define do
    
  factory :sport_keyword do
    rule_type "White Keyword"
    value "Some sport"
    sport_id 1
  end
  
  factory :cricket_sport_keyword, parent: :sport_keyword do |f|
    f.value "Cricket"
  end
  
  factory :tennis_sport_keyword, parent: :sport_keyword do |f|
    f.value "Tennis"
  end
    
  factory :terminator_black_keyword, parent: :sport_keyword do |f|
    f.rule_type "Black Keyword"
    f.value "Terminator"
  end
  
end
