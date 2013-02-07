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
  
  validates :name, :presence => true
  validates :short_name, :presence => true
  validates :xmltv_id, :presence => true
  
  has_many :programs
  
  def self.create_from_raw_channel(raw_channel)
    Channel.find_or_create_by_name(raw_channel.channel_name,
      :short_name => raw_channel.channel_name[0,4],
      :xmltv_id => raw_channel.xmltv_id 
    )
  end
  
end
