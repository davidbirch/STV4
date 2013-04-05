FactoryGirl.define do
  
  factory :region do 
    name "Test Region"
  end
  
  factory :invalid_region, parent: :region do |f|
    f.name ""
  end
  
  factory :region_brisbane, parent: :region do |f|
    f.name "Brisbane"
  end
 
  factory :region_melbourne, parent: :region do |f|
    f.name "Melbourne"
  end 
end
