# == Schema Information
#
# Table name: raw_programs
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  subtitle         :string(255)
#  category         :string(255)
#  description      :string(255)
#  start_datetime   :datetime
#  end_datetime     :datetime
#  region_name      :string(255)
#  channel_xmltv_id :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class RawProgram < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :region_name
  validates_presence_of :channel_xmltv_id
  validates_presence_of :start_datetime
  validates_presence_of :end_datetime
  
  scope :historic, lambda {
      where("end_datetime < ?", Time.now)
  }  
  
end
