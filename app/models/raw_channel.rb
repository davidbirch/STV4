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
  
  validates :xmltv_id, :presence => true
  validates :channel_name, :presence => true
  validates :xmltv_id, :uniqueness => true
  validates :channel_name, :uniqueness => true
  
    
end
