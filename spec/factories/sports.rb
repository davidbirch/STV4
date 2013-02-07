FactoryGirl.define do
  
  factory :sport do
    name "test sport"
  end
  
  factory :cricket_sport, parent: :sport do |f|
    f.name "Cricket"
  end
  
  factory :tennis_sport, parent: :sport do |f|
    f.name "Tennis"
  end
  
end
