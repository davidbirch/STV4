FactoryGirl.define do
  
  factory :region do 
    name "Test Region"
  end
  
  factory :region_brisbane, parent: :region do |f|
    f.name "Brisbane"
  end
  
end
