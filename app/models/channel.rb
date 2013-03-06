# == Schema Information
#
# Table name: channels
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  short_name  :string(255)
#  free_or_pay :string(255)
#  xmltv_id    :string(255)
#

class Channel < ActiveRecord::Base
  
  has_many :programs
  
  validates_presence_of :name
  validates_presence_of :short_name
  validates_presence_of :xmltv_id
  
  validates_uniqueness_of :name
  validates_uniqueness_of :xmltv_id
    
  class << self
    
    def create_from_raw_channel(raw_channel)
      Channel.create(
        :name       => raw_channel.channel_name,
        :short_name => raw_channel.channel_name[0,4],
        :xmltv_id   => raw_channel.xmltv_id 
      )
    end
    
  end
  
end
