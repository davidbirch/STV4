class Channel < ActiveRecord::Base
  
  validates :name, :presence => true
  validates :short_name, :presence => true
  
  has_many :programs
  
end
