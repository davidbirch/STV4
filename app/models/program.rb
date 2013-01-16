class Program < ActiveRecord::Base
  
  belongs_to :channel
  belongs_to :region
  belongs_to :sport
  
end
