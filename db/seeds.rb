# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

# import the data for regions
CSV.open("db/data/regions.csv", "r").each do |row|
  Region.find_or_create_by_name(
    :name => row[0]
  )
end

# import the data for sports
CSV.open("db/data/sports.csv", "r").each do |row|
  Sport.find_or_create_by_name(
    :name => row[0]
  )
end

# import the data for sports
CSV.open("db/data/ruleset - black keywords.csv", "r").each do |row|
  SportKeyword.find_or_create_by_value(
    :rule_type => "Black Keyword",
    :value => row[0]
  )
end

# import the data for sports
CSV.open("db/data/ruleset - white keywords.csv", "r").each do |row|
  SportKeyword.find_or_create_by_value(
    :rule_type => "White Keyword",
    :value => row[0],
    :sport => Sport.find_by_name(row[1]),
    :priority => row[2]
  )
end

# import the data for sports
CSV.open("db/data/ruleset - white sports.csv", "r").each do |row|
  SportKeyword.find_or_create_by_value(
    :rule_type => "White Keyword",
    :value => row[0],
    :sport => Sport.find_by_name(row[1]),
    :priority => row[2]
  )
end