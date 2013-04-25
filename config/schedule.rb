# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#

every 1.day, :at => '4:00 pm' do
  command "perl /home/zebraadmin/get_xmltv_guide_data.pl >> /home/zebraadmin/log/cron.log"
end

every 1.day, :at => '5:00 pm' do
  command "perl /home/zebraadmin/load_raw_guide_data.pl >> /home/zebraadmin/log/cron.log"
end

every 3.hours do
  runner 'NightlyJob.new', :environment => 'production' 
end