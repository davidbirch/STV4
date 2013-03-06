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
  
  validates_presence_of :title
  validates_presence_of :start_datetime
  validates_presence_of :end_datetime
  validates_presence_of :region_id
  validates_presence_of :sport_id
  validates_presence_of :channel_id
  
  validates_uniqueness_of :channel_id , :scope => [:region_id, :title, :start_datetime, :end_datetime]
  
  
  scope :historic, lambda {
      where("end_datetime < ?", Time.now)
  }
  
  scope :current, lambda {
      where("end_datetime >= ?", Time.now)
  }
  
  scope :chronological, order("start_datetime ASC, end_datetime ASC")
  
  scope :by_title, order("title DESC, subtitle DESC")
  scope :by_subtitle, order("subtitle DESC, title DESC")
    
  scope :sorted_for_tv_guide, includes(:sport, :channel).chronological.order("channels.short_name ASC, channels.name ASC").by_subtitle
  
   def full_title
    if subtitle != ""
      title + " (" + subtitle + ")"
    else
      title
    end
   end
   
  def local_start_date
    start_datetime.in_time_zone(region.name).strftime("%a, %d %b %Y")
  end

  def local_start_time
    start_datetime.in_time_zone(region.name).strftime("%R")
  end
  
  def local_end_date
    end_datetime.in_time_zone(region.name).strftime("%a, %d %b %Y") 
  end
  
  def local_end_time
    end_datetime.in_time_zone(region.name).strftime("%R")
  end
    
  class << self
    
    def create_from_raw_program(raw_program)
      
      sport = Sport.find_for_raw_program(raw_program)
      region = Region.find_by_name(raw_program.region_name)
      channel = Channel.find_by_xmltv_id(raw_program.channel_xmltv_id)
          
      # bug where the time zone is not being set properly, calling an 'inspect' seems to fix it
      # may cause performance issues - however this is only uesd in the converter
      raw_program.inspect
      old_time_zone = Time.zone
      Time.zone = raw_program.region_name
        
      program = Program.create(
        :title          => raw_program.title,
        :subtitle       => raw_program.subtitle,
        :category       => raw_program.category,
        :description    => raw_program.description,
        :start_datetime => Time.zone.parse(raw_program.start_datetime.strftime("%F %R")).utc,
        :end_datetime   => Time.zone.parse(raw_program.end_datetime.strftime("%F %R")).utc,
        :region_id      => (region.id unless region.nil?),
        :channel_id     => (channel.id unless channel.nil?),
        :sport_id       => (sport.id unless sport.nil?)
      )
      Time.zone = old_time_zone
      return program
    
    end
  
  end
  
end
