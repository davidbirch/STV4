# == Schema Information
#
# Table name: programs
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  subtitle       :string(255)
#  region_id      :integer
#  sport_id       :integer
#  channel_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category       :string(255)
#  description    :string(255)
#  start_datetime :datetime
#  end_datetime   :datetime
#

class Program < ActiveRecord::Base
  
  belongs_to :channel
  belongs_to :region
  belongs_to :sport
  
  validates :title, :presence => true
  validates :start_datetime, :presence => true
  validates :end_datetime, :presence => true
  validates :region_id, :presence => true
  validates :sport_id, :presence => true
  validates :channel_id, :presence => true
  
  scope :historic, lambda {
      where("end_datetime < ?", Time.now + 10.hours)
  }
  
  def self.create_from_raw_program(raw_program)
    sport = Sport.find_for_raw_program(raw_program)
    region = Region.find_by_name(raw_program.region_name)
    channel = Channel.find_by_xmltv_id(raw_program.channel_xmltv_id)
    unless sport.nil? || region.nil? || channel.nil?
      Program.create(
        :title => raw_program.title,
        :subtitle => raw_program.subtitle,
        :category => raw_program.category,
        :description => raw_program.description,
        :start_datetime => raw_program.start_datetime,
        :end_datetime => raw_program.end_datetime,
        :region_id => region.id,
        :channel_id => channel.id,
        :sport_id => sport.id
      )
    end
  end
  
end
