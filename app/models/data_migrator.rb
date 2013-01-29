class RawChannelMigrator
  
  def initialize(raw_channels)
    migrate_and_purge(raw_channels)
  end
    
  private
  
    def migrate_and_purge(raw_channels)
      raw_channels.each{ |raw_channel|
        Channel.find_or_create_by_name(raw_channel.channel_name,
          :short_name => raw_channel.channel_name[0,4],
          :xmltv_id => raw_channel.xmltv_id
        )
        raw_channel.destroy
      }
    end  

end

class RawProgramMigrator
  
  def initialize(raw_programs)
    migrate_and_purge(raw_programs)
  end
    
  private
  
    def migrate_and_purge(raw_programs)
      raw_programs.each{ |raw_program|
        
        Program.create{
          :title => raw_program.title
          :subtitle => raw_program.subtitle
          :region_id => Region.find_by_name(raw_program.region_name)
          :channel_id => Channel.find_by_xmltv_id(raw_program.channel_xmltv_id)
          :sport_id => "temp"
        }
        
       
        
        #raw_program.destroy
      }
    end  

end
