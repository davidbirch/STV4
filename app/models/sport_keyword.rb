# == Schema Information
#
# Table name: sport_keywords
#
#  id         :integer          not null, primary key
#  rule_type  :string(255)
#  value      :string(255)
#  sport_id   :integer
#  priority   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SportKeyword < ActiveRecord::Base
  
  validates :value, :presence => true
  validates :rule_type, :presence => true
  
  belongs_to :sport
  
  default_scope :select => "*, LENGTH(value) as value_length"
     
  class << self
    
    def check_raw_program(raw_program)
      # algorithm for finding the right sport
      if check_black_keyword(raw_program)
        # black keyword match so return empty
        return ""
      else
        sport_name = get_sport_name(raw_program)
         if sport_name != ""
          # a sportname was returned by get_sport_name
          return sport_name
        elsif check_for_sport_literal_match(raw_program)
          # a generic sport match but exclude news and weather
          if check_for_news_or_weather(raw_program)
            # news or weather match so return empty
            ""
          else
            # match on sport but not news or weather
            return "Other Sport"
          end
        else
          # non-sport records
          return ""
        end
      end
    end
  
    private
    
      def check_black_keyword(raw_program)
        raw_program_title = raw_program["title"].downcase
        raw_program_subtitle = raw_program["subtitle"].downcase
        raw_program_category = raw_program["category"].downcase
       
        black_keywords = SportKeyword.find_all_by_rule_type("Black Keyword")
        black_keywords.each do |black_keyword|
          black_keyword_value = black_keyword["value"].downcase
          if raw_program_title.include? black_keyword_value
            return true
          elsif raw_program_subtitle.include? black_keyword_value  
            return true
          elsif raw_program_category.include? black_keyword_value  
            return true
          else
            #do nothing
          end
        end
        return false
      end
      
      def get_sport_name(raw_program)
        raw_program_title = raw_program["title"].downcase
        raw_program_subtitle = raw_program["subtitle"].downcase
        raw_program_category = raw_program["category"].downcase
       
        return_value = ""
        white_keywords = SportKeyword.where("rule_type = ?","White Keyword").order("priority DESC, value_length DESC")
        white_keywords.each do |white_keyword|
      
          # ****************************************************
          # * this is a slightly complicated block of code but *
          # * it is trying to optimise performance of searches *
          # * for multiple words vs a single word by using a   *
          # * combination of include? and split                *
          # ****************************************************
                
          # get the keyword value
          white_keyword_value = white_keyword["value"].downcase
          white_keyword_sport_id = white_keyword["sport_id"]
          if return_value != ""
            #stop looping once a keyword is found
            break
          elsif white_keyword_value.include? " "
            # the keyword contains a space so it has multiple words
            # in this case do a standard include search
            if raw_program_title.include? white_keyword_value
              # match so return the sport name
              return_value = white_keyword_sport_id
            elsif raw_program_subtitle.include? white_keyword_value
              # match so return the sport name
              return_value = white_keyword_sport_id
            elsif raw_program_category.include? white_keyword_value
              # match so return the sport name
              return_value = white_keyword_sport_id
            else
              # no matches so do nothing
            end
          else
            # the keyword contains no space so it has only one words
            # in this case do a standard include search
            if return_value == ""
              raw_program_title.split.each do |s|
                if s == white_keyword_value
                  # match so return the sport name
                  return_value = white_keyword_sport_id
                end
              end
            end
            # check for a return value again in case a match has already been found
            if return_value == ""
              raw_program_subtitle.split.each do |s|
                if s == white_keyword_value
                  # match so return the sport name
                  return_value = white_keyword_sport_id
                end
              end
            end
            # check for a return value again in case a match has already been found
            if return_value == ""
              raw_program_category.split.each do |s|
                if s == white_keyword_value
                  # match so return the sport name
                  return_value = white_keyword_sport_id
                end
              end
            end
          end
        end
         
        # return the appropriate value
        if return_value == ""
          return ""
        else
          return Sport.find(return_value).name
        end       
      end
      
      def check_for_sport_literal_match(raw_program)
        raw_program_title = raw_program["title"].downcase
        raw_program_subtitle = raw_program["subtitle"].downcase
        raw_program_category = raw_program["category"].downcase
        
        if raw_program_title.include? "sport"
          return_value = true
        elsif raw_program_subtitle.include? "sport"
          return_value = true
        elsif raw_program_category.include? "sport"  
          return_value = true
        else
          # do nothing
        end
        
        # return the appropriate value
        return return_value ||= false
       
      end
      
      def check_for_news_or_weather(raw_program) 
        raw_program_title = raw_program["title"].downcase
        raw_program_subtitle = raw_program["subtitle"].downcase
        raw_program_category = raw_program["category"].downcase
         
        if raw_program_title.include? "weather"
          return_value = true
        elsif raw_program_subtitle.include? "weather"
          return_value = true
        elsif raw_program_category.include? "weather"  
          return_value = true
        elsif raw_program_title.include? "news"
          return_value = true
        elsif raw_program_subtitle.include? "news"
          return_value = true
        elsif raw_program_category.include? "news"  
          return_value = true
        else
          #do nothing
        end
       
        # return the appropriate value
        return return_value ||= false
       
      end
      
  end
  
end
