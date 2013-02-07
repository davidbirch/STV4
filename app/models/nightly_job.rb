class NightlyJob

  def initialize 
    
    RawProgram.historic.delete_all
    
    Program.historic.delete_all
    
    RawChannel.find_each do |raw_channel|
      Channel.create_from_raw_channel(raw_channel)
    end
      
    RawChannel.delete_all
    
    RawProgram.find_each do |raw_program|
      Program.create_from_raw_program(raw_program)
    end
    
    RawProgram.delete_all
    
  end
  
end
