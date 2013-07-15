namespace :app do
  desc "Setup the app"
  task :setup => :environment do
    sh 'rake db:migrate'
    sh 'rake db:seed'
  end
end

