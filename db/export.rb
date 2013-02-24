
require "csv"

CSV.open("db/export/regions.csv", "wb") do |csv|
  Region.all.each do |region|
    csv << [region.name]
  end
end

CSV.open("db/export/sports.csv", "wb") do |csv|
  Sport.all.each do |sport|
    csv << [sport.name]
  end
end

CSV.open("db/export/sport_keywords.csv", "wb") do |csv|
  SportKeyword.all.each do |sport_keyword|
    sport = sport_keyword.sport
    if sport.nil?
    csv << [sport_keyword.rule_type, sport_keyword.value, "", sport_keyword.priority]
  else
    csv << [sport_keyword.rule_type, sport_keyword.value, sport.name, sport_keyword.priority]
    end
    
  end
end

