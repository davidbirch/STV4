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
      where("end_datetime < ?", Time.now)
  }
  
  scope :current, lambda {
      where("end_datetime >= ?", Time.now)
  }
  scope :chronological, order("start_datetime ASC, end_datetime ASC")
  scope :by_title, order("title DESC, subtitle DESC")
  
  scope :format_and_sort_for_html, includes(:sport, :channel).order("start_datetime ASC, end_datetime ASC, channels.short_name ASC, channels.name ASC, subtitle DESC, title DESC")
    
  def start_date
    start_datetime.strftime("%a, %d %b %Y")
  end

  def start_time
    start_datetime.strftime("%R") 
  end
  
  def end_date
    end_datetime.strftime("%a, %d %b %Y") 
  end
  
  def end_time
    end_datetime.strftime("%R")
  end
  
  def full_title
    if subtitle != ""
      title + " (" + subtitle + ")"
    else
      title
    end
  end
   
  def self.create_from_raw_program(raw_program)
    sport = Sport.find_for_raw_program(raw_program)
    region = Region.find_by_name(raw_program.region_name)
    channel = Channel.find_by_xmltv_id(raw_program.channel_xmltv_id)
    unless sport.nil? || region.nil? || channel.nil?
      Time.zone = raw_program.region_name
      Program.create(
        :title => raw_program.title,
        :subtitle => raw_program.subtitle,
        :category => raw_program.category,
        :description => raw_program.description,
        :start_datetime => Time.zone.parse(raw_program.start_datetime.strftime("%F %R")),
        :end_datetime => Time.zone.parse(raw_program.end_datetime.strftime("%F %R")),
        :region_id => region.id,
        :channel_id => channel.id,
        :sport_id => sport.id
      )
    end
  end
  
end
