namespace :db do
  desc "Remaking data"
  task remake_data: :environment do
    Rake::Task["db:migrate:reset"].invoke

    puts "Create admin user"
    FactoryGirl.create :admin

    puts "Create database is sucessfull"
  end
end
