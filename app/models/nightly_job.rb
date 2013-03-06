class NightlyJob

  def initialize 
    
    begin
      log = Logger.new(File.expand_path("#{Rails.root}/log/nightly_job.log", __FILE__))
      log.info("#{Time.now}:  Nightly job started")
      
      starting_raw_program_count = RawProgram.count 
      historic_raw_program_count = RawProgram.historic.count
      RawProgram.historic.delete_all
      
      starting_program_count = Program.count      
      historic_program_count = Program.historic.count
      Program.historic.delete_all
            
      raw_channel_count = RawChannel.count
      starting_channel_count = Channel.count
      channels_created = 0
      channels_skipped = 0
      RawChannel.find_each do |raw_channel|
        channel = Channel.create_from_raw_channel(raw_channel)
        if channel.new_record?
          channels_skipped = channels_skipped + 1
        else
          channels_created = channels_created + 1
        end
      end
      final_channel_count = Channel.count
      
      RawChannel.delete_all
      final_raw_channel_count = RawChannel.count
    
      remaining_raw_program_count = RawProgram.count
      remaining_program_count = Program.count
      programs_created = 0
      programs_skipped = 0
      RawProgram.find_each do |raw_program|
        program = Program.create_from_raw_program(raw_program)
        if program.new_record?
          programs_skipped = programs_skipped + 1
        else
          programs_created = programs_created + 1
        end
      end
      final_program_count = Program.count
      
      RawProgram.delete_all
      final_raw_program_count = RawProgram.count
      
      log.info("#{Time.now}: +-------------+-----------+-----------+-----------+-----------+-----------+-----------+")
      log.info("#{Time.now}: |             | Starting  | Historic  | Remaining |  Created  |  Skipped  | Remaining |")
      log.info("#{Time.now}: +-------------+-----------+-----------+-----------+-----------+-----------+-----------+")
      log.info("#{Time.now}: |Raw Channels |    #{raw_channel_count.to_s.rjust(6)} |       N/A |       N/A |       N/A |       N/A |    #{final_raw_channel_count.to_s.rjust(6)} |")
      log.info("#{Time.now}: |Channels     |    #{starting_channel_count.to_s.rjust(6)} |       N/A |    #{starting_channel_count.to_s.rjust(6)} |    #{channels_created.to_s.rjust(6)} |    #{channels_skipped.to_s.rjust(6)} |    #{final_channel_count.to_s.rjust(6)} |")
      log.info("#{Time.now}: |Raw Programs |    #{starting_raw_program_count.to_s.rjust(6)} |    #{historic_raw_program_count.to_s.rjust(6)} |    #{remaining_raw_program_count.to_s.rjust(6)} |       N/A |       N/A |    #{final_raw_program_count.to_s.rjust(6)} |")
      log.info("#{Time.now}: |Programs     |    #{starting_program_count.to_s.rjust(6)} |    #{historic_program_count.to_s.rjust(6)} |    #{remaining_program_count.to_s.rjust(6)} |    #{programs_created.to_s.rjust(6)} |    #{programs_skipped.to_s.rjust(6)} |    #{final_program_count.to_s.rjust(6)} |")
      log.info("#{Time.now}: +-------------+-----------+-----------+-----------+-----------+-----------+-----------+")
      log.info("#{Time.now}:  Nightly job completed")
    
    rescue => e
      
      log.error("#{Time.now}: #{e.message}")
      log.error("#{Time.now}: #{e.backtrace}")        
      
    end
  end
  
end
