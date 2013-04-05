FactoryGirl.define do
  
  factory :channel do
    name "Test Channel"
    short_name "Test"
    xmltv_id "testchannel.free.au"
  end
  
  factory :invalid_channel, parent: :channel do |f|
    f.name ""
  end
    
  factory :channel_seven, parent: :channel do |f|
    f.name "Seven"
    f.short_name "Sev"
    f.xmltv_id "seven.free.au"
  end
  
  factory :channel_nine, parent: :channel do |f|
    f.name "Nine"
    f.short_name "Nine"
    f.xmltv_id "nine.free.au"
  end
  
  factory :channel_gem, parent: :channel do |f|
    f.name "Gem"
    f.short_name "Nine"
    f.xmltv_id "gem.free.au"
  end
  
end
