FactoryGirl.define do
  
  factory :sport do
    name "test sport"
  end
  
  factory :invalid_sport, parent: :sport do |f|
    f.name ""
  end
    
  factory :cricket_sport, parent: :sport do |f|
    f.name "Cricket"
  end
  
  factory :other_sport, parent: :sport do |f|
    f.name "Other Sport"
  end
  
  factory :tennis_sport, parent: :sport do |f|
    f.name "Tennis"
  end
  
end
