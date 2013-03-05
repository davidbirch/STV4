# == Schema Information
#
# Table name: raw_channels
#
#  id           :integer          not null, primary key
#  xmltv_id     :string(255)
#  channel_name :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class RawChannel < ActiveRecord::Base
  
  validates_presence_of :xmltv_id
  validates_presence_of :channel_name
  
  validates_uniqueness_of :xmltv_id
  validates_uniqueness_of :channel_name  
    
end
