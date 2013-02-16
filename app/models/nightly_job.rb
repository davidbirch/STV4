class NightlyJob

  def initialize 
    
    log = Logger.new(File.expand_path("#{Rails.root}/log/nightly_job.log", __FILE__))
    log.info("#{Time.now}: Nightly job started")
    
    historic_raw_program_count = RawProgram.historic.count
    RawProgram.historic.delete_all
    log.info("#{Time.now}: Number of historic raw programs deleted: #{historic_raw_program_count}")
    
    historic_program_count = Program.historic.count
    Program.historic.delete_all
    log.info("#{Time.now}: Number of historic programs deleted: #{historic_program_count}")
    
    raw_channel_count = RawChannel.count
    starting_channel_count = Channel.count
    RawChannel.find_each do |raw_channel|
      Channel.create_from_raw_channel(raw_channel)
    end
    final_channel_count = Channel.count
    log.info("#{Time.now}: Number of channels created: #{final_channel_count - starting_channel_count}")
      
    RawChannel.delete_all
    log.info("#{Time.now}: Number of raw channels deleted: #{raw_channel_count}")
    
    raw_program_count = RawProgram.count
    starting_program_count = Program.count
    RawProgram.find_each do |raw_program|
      Program.create_from_raw_program(raw_program)
    end
    
    final_program_count = Program.count
    log.info("#{Time.now}: Number of programs created: #{final_program_count - starting_program_count}")
    
    RawProgram.delete_all
    log.info("#{Time.now}: Number of raw programs deleted: #{raw_program_count}")
    
    
    log.info("#{Time.now}: Nightly job completed")
  end
  
end
