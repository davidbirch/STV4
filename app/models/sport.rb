# == Schema Information
#
# Table name: sports
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sport < ActiveRecord::Base
  
  has_many :programs
  has_many :sport_keywords
  
  validates_presence_of :name
  
  validates_uniqueness_of :name
  
  class << self
    
    def find_for_raw_program(raw_program)
      sport_keyword = SportKeyword.check_raw_program(raw_program)
      Sport.find_by_name(sport_keyword)
    end
  
  end
   
end
