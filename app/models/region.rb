# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Region < ActiveRecord::Base
  
  has_many :programs
  
  validates_presence_of :name
  
  validates_uniqueness_of :name
  
  
  
end
