# lib/tasks/db_export.rake
namespace :db do
  task :export => :environment do
    load 'db/export.rb'
  end
end