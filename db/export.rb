
require "csv"

CSV.open("db/data/regions.csv", "wb") do |csv|
  Region.all.each do |region|
    csv << [region.name]
  end
end

CSV.open("db/data/sports.csv", "wb") do |csv|
  Sport.all.each do |sport|
    csv << [sport.name]
  end
end

CSV.open("db/data/channels.csv", "wb") do |csv|
  Channel.all.each do |channel|
    csv << [channel.name, channel.short_name, channel.xmltv_id, channel.black_flag]
  end
end

CSV.open("db/data/sport_keywords.csv", "wb") do |csv|
  SportKeyword.all.each do |sport_keyword|
    sport = sport_keyword.sport
    if sport.nil?
      csv << [sport_keyword.rule_type, sport_keyword.value, "", sport_keyword.priority]
    else
      csv << [sport_keyword.rule_type, sport_keyword.value, sport.name, sport_keyword.priority]
    end  
  end
  
end